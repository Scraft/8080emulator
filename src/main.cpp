#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include <SDL.h>
#include <math.h>

#if defined(NDEBUG) && !defined(_DEBUG) && !defined(DEBUG)
#	define DumpInstruction( _Message, ... )	do { } while ( 0 )
#	define DumpDisassembly( _Message, ... ) do { } while ( 0 )
#else
#	define DumpInstruction( _Message, ... )	do { printf( _Message "\n", __VA_ARGS__ ); } while ( 0 )
#	define DumpDisassembly( _Message, ... )	do { printf( _Message "\n", __VA_ARGS__ ); } while ( 0 )
#endif

typedef Uint16 address;
typedef Uint16 instruction;

struct Cpu8080
{
	Cpu8080( )
	{
	}

	struct Cpu
	{
		Cpu( ) : StackLevel( 0 )
		{ 
			for ( size_t ix = 0; ix < 16; ++ix )
			{
				Stack[ ix ] = 0;
			}
		}

		struct Registers
		{
			Registers( )
			{
				for ( size_t ix = 0; ix < Gpr::Num; ++ix )
				{
					gpr[ ix ] = 0;
				}
				flags = 0;
				sp = 0;
				accumulator = 0;
				i           = 0;
				delay       = 0;
				sound       = 0;
				pc          = 0x0;
			}
			// B, C, D, E, H, L (accessible as pairs AB, DE, HL).
			struct Gpr
			{
				enum T
				{
					B = 0,
					C,
					D,
					E,
					H,
					L,
					Num
				};
			};
			struct GprPair
			{
				enum T
				{
					BC,
					DE,
					HL,
					Num
				};
			};
			union
			{
				unsigned __int8  gpr[ Gpr::Num ];
				unsigned __int16 gprPair[ GprPair::Num ];
			};
			union
			{
				unsigned __int8  flags;
			};
			unsigned __int16 sp;
			unsigned __int8  accumulator;

			unsigned __int16 i;
			unsigned __int8  delay;
			unsigned __int8  sound;
			unsigned __int16 pc;
		};

		Registers			Regs;
		unsigned __int16	Stack[ 64 ];
		size_t				StackLevel;
	};

	Cpu Cpu;

	Uint8 Memory[ 16 * 1024 ];
};


class Api
{
public:

	Api( ) : m_pScreen( NULL ), m_pPixels( NULL ), m_SoundOn( false )
	{
		memset( m_Keys, 0, sizeof( bool ) * 16 );
	}

	void Initialise( )
	{
		//Start SDL
		SDL_Init( SDL_INIT_EVERYTHING );

		//Set up screen
		m_pScreen = SDL_SetVideoMode( 640, 320, 32, SDL_SWSURFACE );

		// Draw stuff.
		if( SDL_MUSTLOCK( m_pScreen ) )
		{
			// Lock the surface
			SDL_LockSurface( m_pScreen );
		}

		m_pPixels = ( Uint32 * )m_pScreen->pixels;

		// Audio
		SDL_AudioSpec desiredSpec;

		desiredSpec.freq = 44100;
		desiredSpec.format = AUDIO_S16SYS;
		desiredSpec.channels = 1;
		desiredSpec.samples = 512;
		desiredSpec.callback = AudioFn;
		desiredSpec.userdata = this;

		SDL_AudioSpec obtainedSpec;

		// you might want to look for errors here
		SDL_OpenAudio(&desiredSpec, &obtainedSpec);

		// start play audio
		SDL_PauseAudio(0);
	}

	bool DrawAt( unsigned __int8 x, unsigned __int8 y, unsigned __int8 h, unsigned __int8 * memory )
	{
		bool anyPixelsUnset = false;

		for ( size_t iy = 0; iy < h; ++iy )
		{
			unsigned __int8 & rRowData = memory[ iy ];

			for ( size_t ix = 0; ix < 8; ++ix )
			{
				if ( rRowData & ( 1 << ( ( 7 - ix ) ) ) )
				{
					anyPixelsUnset |= FlipPixel( x + ix, y + iy );
				}
			}
		}

		return anyPixelsUnset;
	}

	void Tick( )
	{
		if( SDL_MUSTLOCK( m_pScreen ) )
		{
			// Lock the surface
			SDL_UnlockSurface( m_pScreen );
		}

		// Update Screen.
		SDL_Flip( m_pScreen );

		// Draw stuff.
		if( SDL_MUSTLOCK( m_pScreen ) )
		{
			// Lock the surface
			SDL_LockSurface( m_pScreen );
		}

		m_pPixels = ( Uint32 * )m_pScreen->pixels;

		// Input.
		SDL_Event e;
		while ( SDL_PollEvent( &e ) )
		{
			if ( e.type == SDL_KEYDOWN )
			{
				unsigned __int8 index = SDLKeyToInputIndex( e.key.keysym.sym );
				if ( index != 0xff )
				{
					m_Keys[ index ] = true;
				}
			}
			else if ( e.type == SDL_KEYUP )
			{
				unsigned __int8 index = SDLKeyToInputIndex( e.key.keysym.sym );
				if ( index != 0xff )
				{
					m_Keys[ index ] = false;
				}
			}
		}
	}

	void ClearScreen( )
	{
		if( SDL_MUSTLOCK( m_pScreen ) )
		{
			// Lock the surface
			SDL_UnlockSurface( m_pScreen );
		}

		// Clear screen.
		SDL_FillRect( m_pScreen, NULL, 0x000000 );

		// Draw stuff.
		if( SDL_MUSTLOCK( m_pScreen ) )
		{
			// Lock the surface
			SDL_LockSurface( m_pScreen );
		}

		m_pPixels = ( Uint32 * )m_pScreen->pixels;
	}

	bool IsKeyDown( Uint8 ix )
	{
		if ( ix >= 0 && ix <= 16 )
			return m_Keys[ ix ];

		return false;
	}

	void SetSound( bool on )
	{
		m_SoundOn = on;
	}

	void Destroy( )
	{
		//Quit SDL
		SDL_Quit( );
	}

private:

	bool FlipPixel( unsigned __int8 x, unsigned __int8 y )
	{
		if ( x < 0 || x >= 64 || y < 0 || y >= 32 )
			return false;

		bool anyPixelsUnset = false;

		for ( size_t iy = 0; iy < 10; ++iy )											
		{																				
			for ( size_t ix = 0; ix < 10; ++ix )											
			{		
				Uint32 & rPixel = m_pPixels[ ( y * 10 + iy ) * ( m_pScreen->pitch / 4 ) + x * 10 + ix ];
				if ( rPixel )
				{
					anyPixelsUnset = true;
					rPixel = 0;
				}
				else
				{
					rPixel = 0xffffff;	
				}
			}																				
		}	

		return anyPixelsUnset;
	}

	unsigned __int8 SDLKeyToInputIndex( SDLKey & key )
	{
		switch ( key )
		{
			case SDLK_1:
			{
				return 1;
			}
			break;
			case SDLK_2:
			{
				return 2;
			}
			break;
			case SDLK_3:
			{
				return 3;
			}
			break;
			case SDLK_4:
			{
				return 0xc;
			}
			break;

			case SDLK_q:
			{
				return 4;
			}
			break;
			case SDLK_w:
			{
				return 5;
			}
			break;
			case SDLK_e:
			{
				return 6;
			}
			break;
			case SDLK_r:
			{
				return 0xd;
			}
			break;

			case SDLK_a:
			{
				return 7;
			}
			break;
			case SDLK_s:
			{
				return 8;
			}
			break;
			case SDLK_d:
			{
				return 9;
			}
			break;
			case SDLK_f:
			{
				return 0xe;
			}
			break;

			case SDLK_z:
			{
				return 0xa;
			}
			break;
			case SDLK_x:
			{
				return 0;
			}
			break;
			case SDLK_c:
			{
				return 0xb;
			}
			break;
			case SDLK_v:
			{
				return 0xf;
			}
			break;
		}
		return 0xff;
	}

	static void AudioFn( void * userData, Uint8 * stream, int length )
	{
		Api * thisPtr = ( Api *)userData;

		if ( thisPtr->m_SoundOn )
		{
			int i = 0;
			while ( i < length ) 
			{
				stream[i] = ( Uint8 )( 28000 * sinf( i * 0.5f * 2.f * 3.1415f / 44100.f ) );
				i++;
			}
		}
		else
		{
			memset( stream, 0, length );
		}
	}

	SDL_Surface * m_pScreen;
	Uint32 * m_pPixels;
	bool m_Keys[ 16 ];
	bool m_SoundOn;
};

bool ReadFileIntoMemory( const char * file, Uint8 * memory, size_t expectedSize )
{
	FILE * fh = NULL;
	if ( fopen_s( &fh, file, "rb" ) == 0 )
	{
		fseek( fh, 0L, SEEK_END );
		size_t fileSize = ftell( fh );
		fseek( fh, 0L, SEEK_SET );
		if( expectedSize != 2048 )
		{
			return false;
		}
		fread( memory, fileSize, 1, fh );
		fclose( fh );
		return true;
	}
	else
	{
		return false;
	}
}

#define IncrementPc( )						chip8.Cpu.Regs.pc += 1
#define DoubleIncrementPc( )				chip8.Cpu.Regs.pc += 2

#define GetHlMemory( )						chip8.Memory[ chip8.Cpu.Regs.gprPair[ Cpu8080::Cpu::Registers::GprPair::HL ] ]
#define SetHlMemory( _Val )					GetHlMemory( ) = _Val

#define GetRegisterBc( )					chip8.Cpu.Regs.gprPair[ Cpu8080::Cpu::Registers::GprPair::BC ]
#define SetRegisterBc( _Val )				GetRegisterBc( ) = _Val
#define GetBcMemory8( )						chip8.Memory[ GetRegisterBc( ) ]
#define GetBcMemory16( )					( Uint16 &)GetBcMemory8( )
#define SetBcMemory( _Val )					GetBcMemory16( ) = _Val

#define GetRegisterDe( )					chip8.Cpu.Regs.gprPair[ Cpu8080::Cpu::Registers::GprPair::DE ]
#define SetRegisterDe( _Val )				GetRegisterDe( ) = _Val
#define GetDeMemory8( )						chip8.Memory[ GetRegisterDe( ) ]
#define GetDeMemory16( )					( Uint16 &)GetDeMemory8( )
#define SetDeMemory( _Val )					GetDeMemory16( ) = _Val

#define GetRegisterHl( )					chip8.Cpu.Regs.gprPair[ Cpu8080::Cpu::Registers::GprPair::HL ]
#define SetRegisterHl( _Val )				GetRegisterHl( ) = _Val

#define GetAccumulator( )					chip8.Cpu.Regs.accumulator
#define SetAccumulator( _Val )				GetAccumulator( ) = _Val

#define GetMemory8AtAddress( _Addr )		chip8.Memory[ _Addr ]
#define SetMemory8AtAddress( _Addr, _Val )	GetMemory8AtAddress( _Addr ) = _Val

#define GetMemory16AtAddress( _Addr )		( ( Uint16 &)chip8.Memory[ _Addr ] )
#define SetMemory16AtAddress( _Addr, _Val )	GetMemory16AtAddress( _Addr ) = _Val

#define GetRegisterSp( )					chip8.Cpu.Regs.sp
#define SetRegisterSp( _Val )				GetRegisterSp( ) = _Val
#define DecrementSp( )						GetRegisterSp( ) -= 1
#define DoubleDecrementSp( )				GetRegisterSp( ) -= 2
#define IncrementSp( )						GetRegisterSp( ) += 1
#define DoubleIncrementSp( )				GetRegisterSp( ) += 2
#define PushAndDecrementStack8( _Val )		SetMemory8AtAddress( GetRegisterSp( ) - 1, _Val ); DecrementSp( )
#define PushAndDecrementStack16( _Val )		SetMemory16AtAddress( GetRegisterSp( ) - 2, _Val ); DoubleDecrementSp( )

#define PopStack8( )						GetMemory8AtAddress( GetRegisterSp( ) )
#define PopStack16( )						GetMemory16AtAddress( GetRegisterSp( ) )

#define GetFlags( )							chip8.Cpu.Regs.flags
#define SetFlags( _Val )					GetFlags( ) = _Val

int main( int numArgs, char ** args )
{
	Cpu8080 chip8;
	Api api;
	api.Initialise( );

	bool okay = true;
	okay &= ReadFileIntoMemory( "invaders.h", &chip8.Memory[ 0x0000 ], 2048 );
	okay &= ReadFileIntoMemory( "invaders.g", &chip8.Memory[ 0x0800 ], 2048 );
	okay &= ReadFileIntoMemory( "invaders.f", &chip8.Memory[ 0x1000 ], 2048 );
	okay &= ReadFileIntoMemory( "invaders.e", &chip8.Memory[ 0x1800 ], 2048 );
	assert( okay );

	// Previous instruction (for debugging).
	address lastInstruction = 0x0000;

	// Last time we did our 60Hz update.
	Uint32 last60HzTime = SDL_GetTicks( );

	// Instructions processed since last 60hz interval.
	Uint8 instructionsProcessedSinceLastUpdate = 0;

	// Loop forever.
	for ( ; ; )
	{
		// Get time (in milliseconds).
		Uint32 timeNow = SDL_GetTicks( );

		if ( instructionsProcessedSinceLastUpdate >= 15 )
		{
			while ( timeNow - last60HzTime <= 1000.f / 60.f )
			{
				SDL_Delay( 0 );
				timeNow = SDL_GetTicks( );
			}

			instructionsProcessedSinceLastUpdate = 0;
		}

		// If it has been 60Hz since our last update...
		if ( timeNow - last60HzTime > 1000.f / 60.f )
		{
			// Decrement delay register.
			if ( chip8.Cpu.Regs.delay > 0 )
				chip8.Cpu.Regs.delay--;

			// Decrement sound register.
			if ( chip8.Cpu.Regs.sound > 0 )
				chip8.Cpu.Regs.sound--;

			// Update to know when next 60Hz timer should be issued.
			last60HzTime = timeNow;

			// Update API (render to screen, process keys, etc.)
			api.Tick( );
		}

		// Play bleeping sound.
		api.SetSound( chip8.Cpu.Regs.sound > 0 );

		Uint8  instruction = chip8.Memory[ chip8.Cpu.Regs.pc ];
		Uint8  s = instruction & 7;
		Uint8  d = ( instruction >> 3 ) & 7;
		Uint8  immediate[ 2 ] = { chip8.Memory[ chip8.Cpu.Regs.pc + 1 ], chip8.Memory[ chip8.Cpu.Regs.pc + 2 ] };
		Uint16 immediate16 = ( immediate[ 1 ] << 8 ) | immediate[ 0 ];

		switch ( instruction )
		{
			case 0x0000:
			{
				DumpInstruction( "NOP" );
			}
			break;

			// ------------------------------------------------------------
			// Move, Load & Store.
			// ------------------------------------------------------------
			// TODO:
			// MOV r1, r2
			// MOV  M, r
			// MOV  r, M
			// MVI  r, #

			case 0x36:
			{
				// Move immediate memory.
				// Cycles : 10
				DumpDisassembly( "MVI M" );
				DumpInstruction( "(HL) = 0x%x", immediate[ 0 ] );
				SetHlMemory( immediate[ 0 ] );

				// Next instruction is immediate we just used.
				IncrementPc( );
			}
			break;

			case 0x1:
			{
				// Load immediate into register pair BC
				// Cycles : 10
				DumpDisassembly( "LXI B" );
				DumpInstruction( "BC = 0x%x", immediate16 );
				SetRegisterBc( immediate16 );

				// Next two instruction are immediates we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0x11:
			{
				// Load immediate into register pair DE
				// Cycles : 10
				DumpDisassembly( "LXI D" );
				DumpInstruction( "DE = 0x%x", immediate16 );
				SetRegisterDe( immediate16 );

				// Next two instruction are immediates we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0x21:
			{
				// Load immediate into register pair HL
				// Cycles : 10
				DumpDisassembly( "LXI H" );
				DumpInstruction( "HL = 0x%x", immediate16 );
				SetRegisterHl( immediate16 );

				// Next two instruction are immediates we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0x2:
			{
				// Store accumulator into (BC).
				// Cycles : 7
				DumpDisassembly( "STAX B" );
				DumpInstruction( "(BC) = accumulator" );
				SetBcMemory( GetAccumulator( ) );
			}
			break;

			case 0x12:
			{
				// Store accumulator into (DE).
				// Cycles : 7
				DumpDisassembly( "STAX D" );
				DumpInstruction( "(DE) = accumulator" );
				SetDeMemory( GetAccumulator( ) );
			}
			break;

			case 0xa:
			{
				// Load accumulator from (BC).
				// Cycles : 7
				DumpDisassembly( "LDAX B" );
				DumpInstruction( "accumulator = (BC)" );
				SetAccumulator( GetBcMemory8( ) );
			}
			break;

			case 0x1a:
			{
				// Load accumulator from DE.
				// Cycles : 7
				DumpDisassembly( "LDAX D" );
				DumpInstruction( "accumulator = (DE)" );
				SetAccumulator( GetDeMemory8( ) );
			}
			break;

			case 0x32:
			{
				// Store accumulator to address.
				// Cycles : 13
				DumpDisassembly( "STA" );
				DumpInstruction( "(immediate16) = accumulator" );
				SetMemory16AtAddress( immediate16, GetAccumulator( ) );

				// Next two instruction are address we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0x3a:
			{
				// Load accumulator from address.
				// Cycles : 13
				DumpDisassembly( "LDA" );
				DumpInstruction( "accumulator = (immediate16)" );
				SetAccumulator( GetMemory8AtAddress( immediate16 ) );

				// Next two instruction are address we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0x22:
			{
				// Store HL direct.
				// Cycles : 16
				DumpDisassembly( "SHLD" );
				DumpInstruction( "(immediate16) = HL" );
				SetMemory16AtAddress( immediate16, GetRegisterHl( ) );

				// Next two instruction are address we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0x2a:
			{
				// Load HL direct.
				// Cycles : 16
				DumpDisassembly( "LHLD" );
				DumpInstruction( "HL = (immediate16)" );
				SetRegisterHl( GetMemory16AtAddress( immediate16 ) );

				// Next two instruction are address we just used.
				DoubleIncrementPc( );
			}
			break;

			case 0xeb:
			{
				// Exchange DE and HL.
				// Cycles : 4
				DumpDisassembly( "XCHG" );
				DumpInstruction( "DE <=> HL" );
				Uint16 de = GetRegisterDe( );
				Uint16 hl = GetRegisterHl( );
				SetRegisterDe( hl );
				SetRegisterHl( de );
			}
			break;

			// ------------------------------------------------------------
			// Stack operations.
			// ------------------------------------------------------------
			case 0xc5:
			{
				// Push BC onto stack.
				// Cycles : 11
				DumpDisassembly( "PUSH B" );
				DumpInstruction( "(SP-2) = BC ; SP -= 2" );
				PushAndDecrementStack16( GetRegisterBc( ) );
			}
			break;

			case 0xd5:
			{
				// Push DE onto stack.
				// Cycles : 11
				DumpDisassembly( "PUSH D" );
				DumpInstruction( "(SP-2) = DE ; SP -= 2" );
				PushAndDecrementStack16( GetRegisterDe( ) );
			}
			break;

			case 0xe5:
			{
				// Push HL onto stack.
				// Cycles : 11
				DumpDisassembly( "PUSH H" );
				DumpInstruction( "(SP-2) = HL ; SP -= 2" );
				PushAndDecrementStack16( GetRegisterHl( ) );
			}
			break;

			case 0xf5:
			{
				// Push A and flags onto stack.
				// Cycles : 11
				DumpDisassembly( "PUSH PSW" );
				DumpInstruction( "(SP-1) = A ; (SP-2) = FLAGS ; SP -= 2" );
				PushAndDecrementStack8( GetAccumulator( ) );
				PushAndDecrementStack8( GetFlags( ) );
			}
			break;

			case 0xc1:
			{
				// Pop BC from stack.
				// Cycles : 10
				DumpDisassembly( "POP B" );
				DumpInstruction( "BC = (SP) ; SP += 2" );
				SetRegisterBc( PopStack16( ) );
				DoubleIncrementSp( );
			}
			break;

			case 0xd1:
			{
				// Pop DE from stack.
				// Cycles : 10
				DumpDisassembly( "POP D" );
				DumpInstruction( "DE = (SP) ; SP += 2" );
				SetRegisterDe( PopStack16( ) );
				DoubleIncrementSp( );
			}
			break;

			case 0xe1:
			{
				// Pop HL from stack.
				// Cycles : 10
				DumpDisassembly( "POP H" );
				DumpInstruction( "HL = (SP) ; SP += 2" );
				SetRegisterHl( PopStack16( ) );
				DoubleIncrementSp( );
			}
			break;

			case 0xf1:
			{
				// Pop A and flags from stack.
				// Cycles : 10
				DumpDisassembly( "POP PSW" );
				DumpInstruction( "FLAGS = (SP) ; A = (SP+1) ; SP += 2" );
				SetFlags( PopStack8( ) );
				DecrementSp( );
				SetAccumulator( PopStack8( ) );
				DecrementSp( );
			}
			break;

			case 0xe3:
			{
				// (SP) <=> HL.
				// Cycles : 18
				DumpDisassembly( "XTHL" );
				DumpInstruction( "(SP) <=> HL" );
				Uint16 hl = GetRegisterHl( );
				Uint16 derefSp = GetMemory16AtAddress( GetRegisterSp( ) );
				SetRegisterHl( derefSp );
				SetMemory16AtAddress( GetRegisterSp( ), hl );
			}
			break;

			case 0xf9:
			{
				// SP = HL.
				// Cycles : 5
				DumpDisassembly( "SPHL" );
				DumpInstruction( "SP = HL" );
				SetRegisterSp( GetRegisterHl( ) );
			}
			break;

			case 0x31:
			{
				// Load immediate into SP
				// Cycles : 10
				DumpDisassembly( "LXI SP" );
				DumpInstruction( "SP = 0x%x", immediate16 );
				SetRegisterSp( immediate16 );

				// Next two instruction are immediates we just used.
				DoubleIncrementPc( );
			}
			break;




			case 0xc3:
			{
				// Jump to address.
				DumpDisassembly( "JMP 0x%x", immediate16 );
				DumpInstruction( "pc = 0x%x", immediate16 );

				// -1 to take account of the increment at the end of the loop.
				chip8.Cpu.Regs.pc = immediate16 - 1;
			}
			break;
		
			// Switch left two bits.
			switch ( instruction & 0xc0 )
			{
				// 01.
				case 0x40:
				{
					if ( s < 6 && d < 6 )
					{
						// Move register to register.
						DumpDisassembly( "MOV r%d, r%d", d, s );
						DumpInstruction( "gpr[ %d ] = gpr[ %d ]", d, s );
					}
					else if ( s < 6 && d == 6 )
					{
						// Move register to memory.
						DumpDisassembly( "MOV M,  r%d", d, s );
						DumpInstruction( "*gpr[ 4 - 5 ] = gpr[ %d ]", s );
					}
					else if ( s == 6 && d < 6 )
					{
						// Move memory to register.
						DumpDisassembly( "MOV r%d, M", d, s );
						DumpInstruction( "gpr[ %d ] = *gpr[ 4 - 5 ]", d );
					}
					else if ( s == 6 && d == 6 )
					{
						// Halt.
						DumpDisassembly( "HLT" );
						DumpInstruction( "halt" );
						_exit( 0 );
					}
				}
				break;

				// 00.
				case 0:
				{
					if ( s == 6 && d < 6 )
					{
						// Move immediate register.
						DumpDisassembly( "MVI r%d", d );
						DumpInstruction( "gpr[ %d ] = %d", d, immediate[ 0 ] );
					}
					else if ( s == 6 && d == 6 )
					{
						// Move immediate memory.
						DumpDisassembly( "MVI M" );
						DumpInstruction( "*gpr[ 4 - 5 ] = %d", immediate[ 0 ] );
					}
					else if ( s == 1 && d == 0 )
					{
						// Load immediate register pair BC
						DumpDisassembly( "LXI B" );
						DumpInstruction( "gpr[ 0 ] = %d, gpr[ 1 ] = %d", immediate[ 1 ], immediate[ 0 ] );
					}
					else if ( s == 1 && d == 2 )
					{
						// Load immediate register pair DE
						DumpDisassembly( "LXI D" );
						DumpInstruction( "gpr[ 2 ] = %d, gpr[ 3 ] = %d", immediate[ 1 ], immediate[ 0 ] );
					}
					else if ( s == 1 && d == 4 )
					{
						// Load immediate register pair HL
						DumpDisassembly( "LXI H" );
						DumpInstruction( "gpr[ 4 ] = %d, gpr[ 5 ] = %d", immediate[ 1 ], immediate[ 0 ] );
					}
					else if ( s == 2 && d == 0 )
					{
						// Store A indirect.
						DumpDisassembly( "STAX B" );
						DumpInstruction( "*gpr[ 0 - 1 ] = accumlator" );
					}
					else if ( s == 2 && d == 2 )
					{
						// Store A indirect.
						DumpDisassembly( "STAX D" );
						DumpInstruction( "*gpr[ 2 - 3 ] = accumlator" );
					}
					else if ( s == 2 && d == 1 )
					{
						// Store A indirect.
						DumpDisassembly( "LDAX B" );
						DumpInstruction( "accumlator = *gpr[ 0 - 1 ]" );
					}
					else if ( s == 2 && d == 3 )
					{
						// Store A indirect.
						DumpDisassembly( "LDAX D" );
						DumpInstruction( "accumlator = *gpr[ 2 - 3 ]" );
					}
					else if ( s == 2 && d == 6 )
					{
						// Store A indirect.
						DumpDisassembly( "STA" );
						DumpInstruction( "*gpr[ 4 - 5 ] = accumlator" );
					}
				}
				break;
			}
		}

		// Update last instruction (for debugging).
		lastInstruction = instruction;

		// Jump forward to next instruction.
		chip8.Cpu.Regs.pc += 1;

		// Increment instruction counter.
		instructionsProcessedSinceLastUpdate++;
	}

	api.Destroy( );

	return 0;
}
