;
;	Disassembled by:
;		DASMx object code disassembler
;		(c) Copyright 1996-2003   Conquest Consultants
;		Version 1.40 (Oct 18 2003)
;
;	File:		c:\Projects\8080emulator\data\invaders.full
;
;	Size:		8192 bytes
;	Checksum:	C63F
;	CRC-32:		B64CA815
;
;	Date:		Fri Oct 25 20:21:39 2013
;
;	CPU:		Intel 8080 (MCS-80/85 family)
;
;
;
	org	00000H
;
X0000:
	nop
	nop
	nop
	jmp	L18D4
;
	nop
	nop
	push	psw
	push	b
	push	d
	push	h
	jmp	L008C
;
	nop
	push	psw
	push	b
	push	d
	push	h
	mvi	a,080H
	sta	X2072
	lxi	h,X20C0
L001C:
	dcr	m
	call	L17CD
	in	001H
	rrc
	jc	L0067
	lda	X20EA
	ana	a
	jz	L0042
	lda	X20EB
	cpi	099H
	jz	L003E
	adi	001H
	daa
L0038:
	sta	X20EB
	call	L1947
L003E:
	xra	a
L003F:
	sta	X20EA
L0042:
	lda	X20E9
	ana	a
	jz	L0082
	lda	X20EF
	ana	a
	jnz	L006F
	lda	X20EB
	ana	a
	jnz	L005D
	call	L0ABF
	jmp	L0082
;
L005D:
	lda	X2093
	ana	a
	jnz	L0082
	jmp	L0765
;
L0067:
	mvi	a,001H
	sta	X20EA
	jmp	L003F
;
L006F:
	call	L1740
L0072:
	lda	X2032
	sta	X2080
	call	L0100
	call	L0248
	call	L0913
	nop
L0082:
	pop	h
	pop	d
	pop	b
	pop	psw
	ei
	ret
;
	nop
	nop
	nop
	nop
L008C:
	xra	a
	sta	X2072
	lda	X20E9
	ana	a
	jz	L0082
	lda	X20EF
	ana	a
	jnz	L00A5
	lda	X20C1
	rrc
	jnc	L0082
L00A5:
	lxi	h,02020H
	call	L024B
	call	L0141
	jmp	L0082
;
L00B1:
	call	L0886
	push	h
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	shld	X2009
	shld	X200B
	pop	h
	dcx	h
	mov	a,m
	cpi	003H
	jnz	L00C8
	dcr	a
L00C8:
	sta	X2008
	cpi	0FEH
	mvi	a,000H
	jnz	L00D3
	inr	a
L00D3:
	sta	X200D
	ret
;
L00D7:
	mvi	a,002H
	sta	X21FB
	sta	X22FB
	jmp	L08E4
;
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
L0100:
	lxi	h,X2002
	mov	a,m
	ana	a
	jnz	L1538
	push	h
	lda	X2006
	mov	l,a
	lda	X2067
	mov	h,a
	mov	a,m
	ana	a
	pop	h
	jz	L0136
	inx	h
	inx	h
	mov	a,m
	inx	h
	mov	b,m
	ani	0FEH
	rlc
	rlc
	rlc
	mov	e,a
	mvi	d,000H
	lxi	h,01C00H
	dad	d
	xchg
	mov	a,b
	ana	a
	cnz	L013B
	lhld	X200B
	mvi	b,010H
	call	L15D3
L0136:
	xra	a
	sta	X2000
	ret
;
L013B:
	lxi	h,00030H
	dad	d
	xchg
	ret
;
L0141:
	lda	X2068
	ana	a
	rz
	lda	X2000
	ana	a
	rnz
	lda	X2067
	mov	h,a
	lda	X2006
	mvi	d,002H
L0154:
	inr	a
	cpi	037H
	cz	L01A1
	mov	l,a
	mov	b,m
	dcr	b
	jnz	L0154
	sta	X2006
	call	L017A
	mov	h,c
	shld	X200B
	mov	a,l
	cpi	028H
	jc	L1971
	mov	a,d
	sta	X2004
	mvi	a,001H
	sta	X2000
	ret
;
L017A:
	mvi	d,000H
	mov	a,l
	lxi	h,X2009
	mov	b,m
	inx	h
	mov	c,m
L0183:
	cpi	00BH
	jm	L0194
	sbi	00BH
	mov	e,a
	mov	a,b
	adi	010H
	mov	b,a
	mov	a,e
	inr	d
	jmp	L0183
;
L0194:
	mov	l,b
L0195:
	ana	a
	rz
	mov	e,a
	mov	a,c
	adi	010H
	mov	c,a
	mov	a,e
	dcr	a
	jmp	L0195
;
L01A1:
	dcr	d
	jz	L01CD
	lxi	h,X2006
	mvi	m,000H
	inx	h
	mov	c,m
	mvi	m,000H
	call	L01D9
	lxi	h,02005H
	mov	a,m
	inr	a
	ani	001H
	mov	m,a
	xra	a
	lxi	h,X2067
	mov	h,m
	ret
;
	nop
L01C0:
	lxi	h,02100H
L01C3:
	mvi	b,037H
L01C5:
	mvi	m,001H
	inx	h
	dcr	b
	jnz	L01C5
	ret
;
L01CD:
	pop	h
	ret
;
L01CF:
	mvi	a,001H
	mvi	b,0E0H
	lxi	h,02402H
	jmp	L14CC
;
L01D9:
	inx	h
	mov	b,m
	inx	h
	mov	a,c
	add	m
	mov	m,a
	inx	h
	mov	a,b
	add	m
	mov	m,a
	ret
;
L01E4:
	mvi	b,0C0H
L01E6:
	lxi	d,01B00H
	lxi	h,X2000
	jmp	L1A32
;
L01EF:
	lxi	h,02142H
	jmp	L01F8
;
L01F5:
	lxi	h,02242H
L01F8:
	mvi	c,004H
	lxi	d,01D20H
L01FD:
	push	d
	mvi	b,02CH
	call	L1A32
	pop	d
	dcr	c
	jnz	L01FD
	ret
;
L0209:
	mvi	a,001H
	jmp	L021B
;
L020E:
	mvi	a,001H
	jmp	L0214
;
L0213:
	xra	a
L0214:
	lxi	d,02242H
	jmp	L021E
;
L021A:
	xra	a
L021B:
	lxi	d,02142H
L021E:
	sta	X2081
	lxi	b,01602H
	lxi	h,02806H
	mvi	a,004H
L0229:
	push	psw
	push	b
	lda	X2081
	ana	a
	jnz	L0242
	call	L1A69
L0235:
	pop	b
	pop	psw
	dcr	a
	rz
	push	d
	lxi	d,002E0H
	dad	d
	pop	d
	jmp	L0229
;
L0242:
	call	L147C
	jmp	L0235
;
L0248:
	lxi	h,02010H
L024B:
	mov	a,m
	cpi	0FFH
	rz
	cpi	0FEH
	jz	L0281
	inx	h
	mov	b,m
	mov	c,a
	ora	b
	mov	a,c
	jnz	L0277
	inx	h
	mov	a,m
	ana	a
	jnz	L0288
	inx	h
	mov	e,m
	inx	h
	mov	d,m
	push	h
	xchg
	push	h
	lxi	h,0026FH
	xthl
	push	d
	pchl							;INFO: index jump
;
	pop	h
	lxi	d,0000CH
	dad	d
	jmp	L024B
;
L0277:
	dcr	b
	inr	b
	jnz	L027D
	dcr	a
L027D:
	dcr	b
	mov	m,b
	dcx	h
	mov	m,a
L0281:
	lxi	d,00010H
	dad	d
	jmp	L024B
;
L0288:
	dcr	m
	dcx	h
	dcx	h
	jmp	L0281
;
	pop	h
	inx	h
	mov	a,m
	cpi	0FFH
	jz	L033B
	inx	h
	dcr	m
	rnz
	mov	b,a
	xra	a
	sta	X2068
	sta	X2069
	mvi	a,030H
	sta	X206A
	mov	a,b
	mvi	m,005H
	inx	h
	dcr	m
	jnz	L039B
	lhld	X201A
	mvi	b,010H
	call	L1424
	lxi	h,02010H
	lxi	d,01B10H
	mvi	b,010H
	call	L1A32
	mvi	b,000H
	call	L19DC
	lda	X206D
	ana	a
	rnz
	lda	X20EF
	ana	a
	rz
	lxi	sp,02400H
	ei
	call	L19D7
	call	L092E
	ana	a
	jz	L166D
	call	L18E7
	mov	a,m
	ana	a
	jz	L032C
	lda	X20CE
	ana	a
	jz	L032C
L02ED:
	lda	X2067
	push	psw
	rrc
	jc	L0332
	call	L020E
L02F8:
	call	L0878
	mov	m,e
	inx	h
	mov	m,d
	dcx	h
	dcx	h
	mov	m,b
	nop
	call	L01E4
	pop	psw
	rrc
	mvi	a,021H
	mvi	b,000H
	jnc	L0312
	mvi	b,020H
	mvi	a,022H
L0312:
	sta	X2067
	call	L0AB6
	xra	a
	sta	X2011
	mov	a,b
	out	005H
	inr	a
	sta	X2098
	call	L09D6
	call	L1A7F
	jmp	L07F9
;
L032C:
	call	L1A7F
	jmp	L0817
;
L0332:
	call	L0209
	jmp	L02F8
;
	nop
	nop
	nop
L033B:
	lxi	h,X2068
	mvi	m,001H
	inx	h
	mov	a,m
	ana	a
	jmp	L03B0
;
L0346:
	nop
	dcx	h
	mvi	m,001H
L034A:
	lda	X201B
	mov	b,a
	lda	X20EF
	ana	a
	jnz	L0363
	lda	X201D
	rrc
	jc	L0381
	rrc
	jc	L038E
	jmp	L036F
;
L0363:
	call	L17C0
	rlc
	rlc
	jc	L0381
	rlc
	jc	L038E
L036F:
	lxi	h,X2018
	call	L1A3B
	call	L1A47
	call	L1439
	mvi	a,000H
	sta	X2012
	ret
;
L0381:
	mov	a,b
	cpi	0D9H
	jz	L036F
	inr	a
	sta	X201B
	jmp	L036F
;
L038E:
	mov	a,b
	cpi	030H
	jz	L036F
	dcr	a
	sta	X201B
	jmp	L036F
;
L039B:
	inr	a
	ani	001H
	sta	X2015
	rlc
	rlc
	rlc
	rlc
	lxi	h,01C70H
	add	l
	mov	l,a
	shld	X2018
	jmp	L036F
;
L03B0:
	jnz	L034A
	inx	h
	dcr	m
	jnz	L034A
	jmp	L0346
;
	lxi	d,X202A
	call	L1A06
	pop	h
	rnc
	inx	h
	mov	a,m
	ana	a
	rz
	cpi	001H
	jz	L03FA
	cpi	002H
	jz	L040A
	inx	h
	cpi	003H
	jnz	L042A
	dcr	m
	jz	L0436
	mov	a,m
	cpi	00FH
	rnz
	push	h
	call	L0430
	call	L1452
	pop	h
	inx	h
	inr	m
	inx	h
	inx	h
	dcr	m
	dcr	m
	inx	h
	dcr	m
	dcr	m
	dcr	m
	inx	h
	mvi	m,008H
	call	L0430
	jmp	L1400
;
L03FA:
	inr	a
	mov	m,a
	lda	X201B
	adi	008H
	sta	X202A
	call	L0430
	jmp	L1400
;
L040A:
	call	L0430
	push	d
	push	h
	push	b
	call	L1452
	pop	b
	pop	h
	pop	d
	lda	X202C
	add	l
	mov	l,a
	sta	X2029
	call	L1491
	lda	X2061
	ana	a
	rz
	sta	X2002
	ret
;
L042A:
	cpi	005H
	rz
	jmp	L0436
;
L0430:
	lxi	h,02027H
	jmp	L1A3B
;
L0436:
	call	L0430
	call	L1452
	lxi	h,X2025
	lxi	d,01B25H
	mvi	b,007H
	call	L1A32
	lhld	X208D
	inr	l
	mov	a,l
	cpi	063H
	jc	L0453
	mvi	l,054H
L0453:
	shld	X208D
	lhld	X208F
	inr	l
	shld	X208F
	lda	X2084
	ana	a
	rnz
	mov	a,m
	ani	001H
	lxi	b,00229H
	jnz	L046E
	lxi	b,0FEE0H
L046E:
	lxi	h,X208A
	mov	m,c
	inx	h
	inx	h
	mov	m,b
	ret
;
	pop	h
	lda	X1B32
	sta	X2032
	lhld	X2038
	mov	a,l
	ora	h
	jnz	L048A
	dcx	h
	shld	X2038
	ret
;
L048A:
	lxi	d,02035H
	mvi	a,0F9H
	call	L0550
	lda	X2046
	sta	X2070
	lda	X2056
	sta	X2071
	call	L0563
	lda	X2078
	ana	a
	lxi	h,02035H
	jnz	L055B
	lxi	d,01B30H
	lxi	h,02030H
	mvi	b,010H
	jmp	L1A32
;
	pop	h
	lda	X206E
	ana	a
	rnz
	lda	X2080
	cpi	001H
	rnz
	lxi	d,02045H
	mvi	a,0EDH
	call	L0550
	lda	X2036
	sta	X2070
	lda	X2056
	sta	X2071
	call	L0563
	lda	X2076
	cpi	010H
	jc	L04E7
	lda	X1B48
	sta	X2076
L04E7:
	lda	X2078
	ana	a
	lxi	h,02045H
	jnz	L055B
	lxi	d,01B40H
	lxi	h,02040H
	mvi	b,010H
	call	L1A32
	lda	X2082
	dcr	a
	jnz	L0508
	mvi	a,001H
	sta	X206E
L0508:
	lhld	X2076
	jmp	L067E
;
	pop	h
L050F:
	lxi	d,X2055
	mvi	a,0DBH
	call	L0550
	lda	X2046
	sta	X2070
	lda	X2036
	sta	X2071
	call	L0563
	lda	X2076
	cpi	015H
	jc	L0534
	lda	X1B58
	sta	X2076
L0534:
	lda	X2078
	ana	a
	lxi	h,X2055
	jnz	L055B
	lxi	d,01B50H
	lxi	h,02050H
	mvi	b,010H
	call	L1A32
	lhld	X2076
	shld	X2058
	ret
;
L0550:
	sta	X207F
	lxi	h,X2073
	mvi	b,00BH
	jmp	L1A32
;
L055B:
	lxi	d,X2073
	mvi	b,00BH
	jmp	L1A32
;
L0563:
	lxi	h,X2073
	mov	a,m
	ani	080H
	jnz	L05C1
	lda	X20C1
	cpi	004H
	lda	X2069
	jz	L05B7
	ana	a
	rz
	inx	h
	mvi	m,000H
	lda	X2070
	ana	a
	jz	L0589
	mov	b,a
	lda	X20CF
	cmp	b
	rnc
L0589:
	lda	X2071
	ana	a
	jz	L0596
	mov	b,a
	lda	X20CF
	cmp	b
	rnc
L0596:
	inx	h
	mov	a,m
	ana	a
	jz	L061B
	lhld	X2076
	mov	c,m
	inx	h
	nop
	shld	X2076
L05A5:
	call	L062F
	rnc
	call	L017A
	mov	a,c
	adi	007H
	mov	h,a
	mov	a,l
	sui	00AH
	mov	l,a
	shld	X207B
L05B7:
	lxi	h,X2073
	mov	a,m
	ori	080H
	mov	m,a
	inx	h
	inr	m
	ret
;
L05C1:
	lxi	d,0207CH
	call	L1A06
	rnc
	inx	h
	mov	a,m
	ani	001H
	jnz	L0644
	inx	h
	inr	m
	call	L0675
	lda	X2079
	adi	003H
	lxi	h,X207F
	cmp	m
	jc	L05E2
	sui	00CH
L05E2:
	sta	X2079
	lda	X207B
	mov	b,a
	lda	X207E
	add	b
	sta	X207B
	call	L066C
	lda	X207B
	cpi	015H
	jc	L0612
	lda	X2061
	ana	a
	rz
	lda	X207B
	cpi	01EH
	jc	L0612
	cpi	027H
	nop
	jnc	L0612
	sub	a
	sta	X2015
L0612:
	lda	X2073
	ori	001H
	sta	X2073
	ret
;
L061B:
	lda	X201B
	adi	008H
	mov	h,a
	call	L156F
	mov	a,c
	cpi	00CH
	jc	L05A5
	mvi	c,00BH
	jmp	L05A5
;
L062F:
	dcr	c
	lda	X2067
	mov	h,a
	mov	l,c
	mvi	d,005H
L0637:
	mov	a,m
	ana	a
	stc
	rnz
	mov	a,l
	adi	00BH
	mov	l,a
	dcr	d
	jnz	L0637
	ret
;
L0644:
	lxi	h,X2078
	dcr	m
	mov	a,m
	cpi	003H
	jnz	L0667
	call	L0675
	lxi	h,01CDCH
	shld	X2079
	lxi	h,0207CH
	dcr	m
	dcr	m
	dcx	h
	dcr	m
	dcr	m
	mvi	a,006H
	sta	X207D
	jmp	L066C
;
L0667:
	ana	a
	rnz
	jmp	L0675
;
L066C:
	lxi	h,X2079
	call	L1A3B
	jmp	L1491
;
L0675:
	lxi	h,X2079
	call	L1A3B
	jmp	L1452
;
L067E:
	shld	X2048
	ret
;
	pop	h
	lda	X2080
	cpi	002H
	rnz
	lxi	h,X2083
	mov	a,m
	ana	a
	jz	L050F
	lda	X2056
	ana	a
	jnz	L050F
	inx	h
	mov	a,m
	ana	a
	jnz	L06AB
	lda	X2082
	cpi	008H
	jc	L050F
	mvi	m,001H
	call	L073C
L06AB:
	lxi	d,X208A
	call	L1A06
	rnc
	lxi	h,X2085
	mov	a,m
	ana	a
	jnz	L06D6
	lxi	h,X208A
	mov	a,m
	inx	h
	inx	h
	add	m
	sta	X208A
	call	L073C
	lxi	h,X208A
	mov	a,m
	cpi	028H
	jc	L06F9
	cpi	0E1H
	jnc	L06F9
	ret
;
L06D6:
	mvi	b,0FEH
	call	L19DC
	inx	h
	dcr	m
	mov	a,m
	cpi	01FH
	jz	L074B
	cpi	018H
	jz	L070C
	ana	a
	rnz
	mvi	b,0EFH
	lxi	h,X2098
	mov	a,m
	ana	b
	mov	m,a
	ani	020H
	out	005H
	nop
	nop
	nop
L06F9:
	call	L0742
	call	L14CB
	lxi	h,X2083
	mvi	b,00AH
	call	L075F
L0707:
	mvi	b,0FEH
	jmp	L19DC
;
L070C:
	mvi	a,001H
	sta	X20F1
	lhld	X208D
	mov	b,m
	mvi	c,004H
	lxi	h,01D50H
	lxi	d,01D4CH
L071D:
	ldax	d
	cmp	b
	jz	L0728
	inx	h
	inx	d
	dcr	c
	jnz	L071D
L0728:
	mov	a,m
	sta	X2087
	mvi	h,000H
	mov	l,b
	dad	h
	dad	h
	dad	h
	dad	h
	shld	X20F2
	call	L0742
	jmp	L08F1
;
L073C:
	call	L0742
	jmp	L1439
;
L0742:
	lxi	h,X2087
	call	L1A3B
	jmp	L1A47
;
L074B:
	mvi	b,010H
	lxi	h,X2098
	mov	a,m
	ora	b
	mov	m,a
	call	L1770
	lxi	h,01D7CH
	shld	X2087
	jmp	L073C
;
L075F:
	lxi	d,01B83H
	jmp	L1A32
;
L0765:
	mvi	a,001H
	sta	X2093
	lxi	sp,02400H
	ei
	call	L1979
	call	L09D6
	lxi	h,03013H
	lxi	d,01FF3H
	mvi	c,004H
	call	L08F3
L077F:
	lda	X20EB
	dcr	a
	lxi	h,02810H
	mvi	c,014H
	jnz	L0857
	lxi	d,01ACFH
	call	L08F3
	in	001H
	ani	004H
	jz	L077F
L0798:
	mvi	b,099H
	xra	a
L079B:
	sta	X20CE
	lda	X20EB
	add	b
	daa
	sta	X20EB
	call	L1947
	lxi	h,X0000
	shld	X20F8
	shld	X20FC
	call	L1925
	call	L192B
	call	L19D7
	lxi	h,00101H
	mov	a,h
	sta	X20EF
	shld	X20E7
	shld	X20E5
	call	L1956
	call	L01EF
	call	L01F5
	call	L08D1
	sta	X21FF
	sta	X22FF
	call	L00D7
	xra	a
	sta	X21FE
	sta	X22FE
	call	L01C0
	call	L1904
	lxi	h,03878H
	shld	X21FC
	shld	X22FC
	call	L01E4
	call	L1A7F
L07F9:
	call	L088D
	call	L09D6
	nop
	xra	a
	sta	X20C1
L0804:
	call	L01CF
	lda	X2067
	rrc
	jc	L0872
	call	L0213
	call	L01CF
L0814:
X0814:
	call	L00B1
L0817:
	call	L19D1
	mvi	b,020H
	call	L18FA
L081F:
	call	L1618
	call	L190A
	call	L15F3
	call	L0988
	lda	X2082
	ana	a
	jz	L09EF
	call	L170E
	call	L0935
	call	L08D8
	call	L172C
	call	L0A59
	jz	L0849
	mvi	b,004H
	call	L18FA
L0849:
X0849:
	call	L1775
	out	006H
	call	L1804
	jmp	L081F
;
	nop
	nop
	nop
L0857:
	lxi	d,01ABAH
	call	L08F3
	mvi	b,098H
	in	001H
	rrc
	rrc
	jc	L086D
	rrc
	jc	L0798
	jmp	L077F
;
L086D:
	mvi	a,001H
	jmp	L079B
;
L0872:
	call	L021A
	jmp	L0814
;
L0878:
	lda	X2008
	mov	b,a
	lhld	X2009
	xchg
	jmp	L0886
;
	nop
	nop
	nop
L0886:
	lda	X2067
	mov	h,a
	mvi	l,0FCH
	ret
;
L088D:
	lxi	h,02B11H
	lxi	d,01B70H
	mvi	c,00EH
	call	L08F3
	lda	X2067
	rrc
	mvi	a,01CH
	lxi	h,03711H
	cnc	L08FF
	mvi	a,0B0H
	sta	X20C0
L08A9:
	lda	X20C0
	ana	a
	rz
	ani	004H
	jnz	L08BC
	call	L09CA
	call	L1931
	jmp	L08A9
;
L08BC:
	mvi	b,020H
	lxi	h,0271CH
	lda	X2067
	rrc
	jc	L08CB
	lxi	h,0391CH
L08CB:
	call	L14CB
	jmp	L08A9
;
L08D1:
	in	002H
	ani	003H
	adi	003H
	ret
;
L08D8:
	lda	X2082
	cpi	009H
	rnc
	mvi	a,0FBH
	sta	X207E
	ret
;
L08E4:
	lda	X20CE
	ana	a
	rnz
	lxi	h,0391CH
	mvi	b,020H
	jmp	L14CB
;
L08F1:
	mvi	c,003H
L08F3:
	ldax	d
	push	d
	call	L08FF
	pop	d
	inx	d
	dcr	c
	jnz	L08F3
	ret
;
L08FF:
	lxi	d,01E00H
	push	h
	mvi	h,000H
	mov	l,a
	dad	h
	dad	h
	dad	h
	dad	d
	xchg
	pop	h
	mvi	b,008H
	out	006H
	jmp	L1439
;
L0913:
	lda	X2009
	cpi	078H
	rnc
	lhld	X2091
	mov	a,l
	ora	h
	jnz	L0929
	lxi	h,00600H
	mvi	a,001H
	sta	X2083
L0929:
	dcx	h
	shld	X2091
	ret
;
L092E:
	call	L1611
	mvi	l,0FFH
	mov	a,m
	ret
;
L0935:
	call	L1910
	dcx	h
	dcx	h
	mov	a,m
	ana	a
	rz
	mvi	b,015H
	in	002H
	ani	008H
	jz	L0948
	mvi	b,010H
L0948:
	call	L09CA
	inx	h
	mov	a,m
	cmp	b
	rc
	call	L092E
	inr	m
	mov	a,m
	push	psw
	lxi	h,02501H
L0958:
	inr	h
	inr	h
	dcr	a
	jnz	L0958
	mvi	b,010H
	lxi	d,01C60H
	call	L1439
	pop	psw
	inr	a
	call	L1A8B
	call	L1910
	dcx	h
	dcx	h
	mvi	m,000H
	mvi	a,0FFH
	sta	X2099
	mvi	b,010H
	jmp	L18FA
;
L097C:
	lxi	h,01DA0H
	cpi	002H
	rc
	inx	h
	cpi	004H
	rc
	inx	h
	ret
;
L0988:
	call	L09CA
	lda	X20F1
	ana	a
	rz
	xra	a
	sta	X20F1
	push	h
	lhld	X20F2
	xchg
	pop	h
	mov	a,m
	add	e
	daa
	mov	m,a
	mov	e,a
	inx	h
	mov	a,m
	adc	d
	daa
	mov	m,a
	mov	d,a
	inx	h
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	jmp	L09AD
;
L09AD:
	mov	a,d
	call	L09B2
	mov	a,e
L09B2:
	push	d
	push	psw
	rrc
	rrc
	rrc
	rrc
	ani	00FH
	call	L09C5
	pop	psw
	ani	00FH
	call	L09C5
	pop	d
	ret
;
L09C5:
	adi	01AH
	jmp	L08FF
;
L09CA:
	lda	X2067
	rrc
	lxi	h,X20F8
	rc
	lxi	h,X20FC
	ret
;
L09D6:
	lxi	h,02402H
L09D9:
	mvi	m,000H
	inx	h
	mov	a,l
	ani	01FH
	cpi	01CH
	jc	L09E8
	lxi	d,00006H
	dad	d
L09E8:
	mov	a,h
	cpi	040H
	jc	L09D9
	ret
;
L09EF:
	call	L0A3C
	xra	a
	sta	X20E9
	call	L09D6
	lda	X2067
	push	psw
	call	L01E4
	pop	psw
	sta	X2067
	lda	X2067
	mov	h,a
	push	h
	mvi	l,0FEH
	mov	a,m
	ani	007H
	inr	a
	mov	m,a
	lxi	h,01DA2H
L0A13:
	inx	h
	dcr	a
	jnz	L0A13
	mov	a,m
	pop	h
	mvi	l,0FCH
	mov	m,a
	inx	h
	mvi	m,038H
	mov	a,h
	rrc
	jc	L0A33
	mvi	a,021H
	sta	X2098
	call	L01F5
	call	L1904
	jmp	L0804
;
L0A33:
	call	L01EF
	call	L01C0
	jmp	L0804
;
L0A3C:
	call	L0A59
	jnz	L0A52
	mvi	a,030H
	sta	X20C0
L0A47:
	lda	X20C0
	ana	a
	rz
	call	L0A59
	jz	L0A47
L0A52:
	call	L0A59
	jnz	L0A52
	ret
;
L0A59:
	lda	X2015
	cpi	0FFH
	ret
;
L0A5F:
	lda	X20EF
	ana	a
	jz	L0A7C
	mov	c,b
	mvi	b,008H
	call	L18FA
	mov	b,c
	mov	a,b
	call	L097C
	mov	a,m
	lxi	h,020F3H
	mvi	m,000H
	dcx	h
	mov	m,a
	dcx	h
	mvi	m,001H
L0A7C:
	lxi	h,02062H
	ret
;
L0A80:
	mvi	a,002H
	sta	X20C1
L0A85:
	out	006H
	lda	X20CB
	ana	a
	jz	L0A85
	xra	a
	sta	X20C1
	ret
;
L0A93:
	push	d
	ldax	d
	call	L08FF
	pop	d
	mvi	a,007H
	sta	X20C0
L0A9E:
	lda	X20C0
	dcr	a
	jnz	L0A9E
	inx	d
	dcr	c
	jnz	L0A93
	ret
;
L0AAB:
	lxi	h,02050H
	jmp	L024B
;
L0AB1:
	mvi	a,040H
	jmp	L0AD7
;
L0AB6:
	mvi	a,080H
	jmp	L0AD7
;
L0ABB:
	pop	h
	jmp	L0072
;
L0ABF:
	lda	X20C1
	rrc
	jc	L0ABB
	rrc
	jc	L1868
	rrc
	jc	L0AAB
	ret
;
L0ACF:
	lxi	h,02B14H
	mvi	c,00FH
	jmp	L0A93
;
L0AD7:
	sta	X20C0
L0ADA:
	lda	X20C0
	ana	a
	jnz	L0ADA
	ret
;
L0AE2:
	lxi	h,X20C2
	mvi	b,00CH
	jmp	L1A32
;
L0AEA:
	xra	a
	out	003H
	out	005H
	call	L1982
	ei
	call	L0AB1
	lda	X20EC
	ana	a
	lxi	h,03017H
	mvi	c,004H
	jnz	L0BE8
	lxi	d,01CFAH
	call	L0A93
	lxi	d,01DAFH
L0B0B:
	call	L0ACF
	call	L0AB1
	call	L1815
	call	L0AB6
	lda	X20EC
	ana	a
	jnz	L0B4A
	lxi	d,01A95H
	call	L0AE2
	call	L0A80
	lxi	d,01BB0H
	call	L0AE2
	call	L0A80
	call	L0AB1
	lxi	d,01FC9H
	call	L0AE2
	call	L0A80
	call	L0AB1
	lxi	h,033B7H
	mvi	b,00AH
	call	L14CB
	call	L0AB6
L0B4A:
	call	L09D6
	lda	X21FF
	ana	a
	jnz	L0B5D
	call	L08D1
	sta	X21FF
	call	L1A7F
L0B5D:
	call	L01E4
	call	L01C0
	call	L01EF
	call	L021A
	mvi	a,001H
	sta	X20C1
	call	L01CF
L0B71:
	call	L1618
	call	L0BF1
	out	006H
	call	L0A59
	jz	L0B71
	xra	a
	sta	X2025
L0B83:
	call	L0A59
	jnz	L0B83
L0B89:
	xra	a
	sta	X20C1
	call	L0AB1
	call	L1988
	mvi	c,00CH
	lxi	h,02C11H
	lxi	d,01F90H
	call	L08F3
	lda	X20EC
	cpi	000H
	jnz	L0BAE
	lxi	h,03311H
	mvi	a,002H
	call	L08FF
L0BAE:
	lxi	b,01F9CH
	call	L1856
	call	L184C
	in	002H
	rlc
	jc	L0BC3
	lxi	b,01FA0H
	call	L183A
L0BC3:
	call	L0AB6
	lda	X20EC
	cpi	000H
	jnz	L0BDA
	lxi	d,01FD5H
	call	L0AE2
	call	L0A80
	call	L189E
L0BDA:
	lxi	h,X20EC
	mov	a,m
	inr	a
	ani	001H
	mov	m,a
	call	L09D6
	jmp	L18DF
;
L0BE8:
	lxi	d,01DABH
	call	L0A93
	jmp	L0B0B
;
L0BF1:
	call	L190A
	jmp	L199A
;
	inx	d
	nop
;
	db	008H
;
	inx	d
	mvi	c,026H
	stax	b
	mvi	c,00FH
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
L1004:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
L1400:
	nop
	call	L1474
	nop
L1405:
	push	b
	push	h
	ldax	d
	out	004H
	in	003H
	ora	m
	mov	m,a
	inx	h
	inx	d
	xra	a
	out	004H
	in	003H
	ora	m
	mov	m,a
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L1405
	ret
;
	nop
	nop
L1424:
	call	L1474
L1427:
	push	b
	push	h
	xra	a
	mov	m,a
	inx	h
	mov	m,a
	inx	h
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L1427
	ret
;
L1439:
	push	b
	ldax	d
	mov	m,a
	inx	d
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L1439
	ret
;
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
L1452:
	call	L1474
L1455:
	push	b
	push	h
	ldax	d
	out	004H
	in	003H
	cma
	ana	m
	mov	m,a
	inx	h
	inx	d
	xra	a
	out	004H
	in	003H
	cma
	ana	m
	mov	m,a
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L1455
	ret
;
L1474:
	mov	a,l
	ani	007H
	out	002H
	jmp	L1A47
;
L147C:
	push	b
	push	h
L147E:
	mov	a,m
	stax	d
	inx	d
	inx	h
	dcr	c
	jnz	L147E
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L147C
	ret
;
L1491:
	call	L1474
	xra	a
	sta	X2061
L1498:
	push	b
	push	h
	ldax	d
	out	004H
	in	003H
	push	psw
	ana	m
	jz	L14A9
	mvi	a,001H
	sta	X2061
L14A9:
	pop	psw
	ora	m
	mov	m,a
	inx	h
	inx	d
	xra	a
	out	004H
	in	003H
	push	psw
	ana	m
	jz	L14BD
	mvi	a,001H
	sta	X2061
L14BD:
	pop	psw
	ora	m
	mov	m,a
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L1498
	ret
;
L14CB:
	xra	a
L14CC:
	push	b
	mov	m,a
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L14CC
	ret
;
L14D8:
	lda	X2025
	cpi	005H
	rz
	cpi	002H
	rnz
	lda	X2029
	cpi	0D8H
	mov	b,a
	jnc	L1530
	lda	X2002
	ana	a
	rz
	mov	a,b
	cpi	0CEH
	jnc	L1579
	adi	006H
	mov	b,a
	lda	X2009
	cpi	090H
	jnc	L1504
	cmp	b
	jnc	L1530
L1504:
	mov	l,b
	call	L1562
	lda	X202A
	mov	h,a
	call	L156F
	shld	X2064
	mvi	a,005H
	sta	X2025
	call	L1581
	mov	a,m
	ana	a
	jz	L1530
	mvi	m,000H
	call	L0A5F
	call	L1A3B
	call	L15D3
	mvi	a,010H
	sta	X2003
	ret
;
L1530:
	mvi	a,003H
	sta	X2025
	jmp	L154A
;
L1538:
	lxi	h,X2003
	dcr	m
	rnz
	lhld	X2064
	mvi	b,010H
	call	L1424
L1545:
	mvi	a,004H
	sta	X2025
L154A:
	xra	a
	sta	X2002
	mvi	b,0F7H
	jmp	L19DC
;
	nop
L1554:
	mvi	c,000H
	cmp	h
	cnc	L1590
L155A:
	cmp	h
	rnc
	adi	010H
	inr	c
	jmp	L155A
;
L1562:
	lda	X2009
	mov	h,l
	call	L1554
	mov	b,c
	dcr	b
	sbi	010H
	mov	l,a
	ret
;
L156F:
	lda	X200A
	call	L1554
	sbi	010H
	mov	h,a
	ret
;
L1579:
	mvi	a,001H
	sta	X2085
	jmp	L1545
;
L1581:
	mov	a,b
	rlc
	rlc
	rlc
	add	b
	add	b
	add	b
	add	c
	dcr	a
	mov	l,a
	lda	X2067
	mov	h,a
	ret
;
L1590:
	inr	c
	adi	010H
	jm	L1590
	ret
;
L1597:
	lda	X200D
	ana	a
	jnz	L15B7
	lxi	h,03EA4H
	call	L15C5
	rnc
	mvi	b,0FEH
	mvi	a,001H
L15A9:
	sta	X200D
	mov	a,b
	sta	X2008
	lda	X200E
	sta	X2007
	ret
;
L15B7:
	lxi	h,02524H
	call	L15C5
	rnc
	call	L18F1
	xra	a
	jmp	L15A9
;
L15C5:
	mvi	b,017H
L15C7:
	mov	a,m
	ana	a
	jnz	L166B
	inx	h
	dcr	b
	jnz	L15C7
	ret
;
	nop
L15D3:
	call	L1474
	push	h
L15D7:
	push	b
	push	h
	ldax	d
	out	004H
	in	003H
	mov	m,a
	inx	h
	inx	d
	xra	a
	out	004H
	in	003H
	mov	m,a
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L15D7
	pop	h
	ret
;
L15F3:
	call	L1611
	lxi	b,03700H
L15F9:
	mov	a,m
	ana	a
	jz	L15FF
	inr	c
L15FF:
	inx	h
	dcr	b
	jnz	L15F9
	mov	a,c
	sta	X2082
	cpi	001H
	rnz
	lxi	h,0206BH
	mvi	m,001H
	ret
;
L1611:
	mvi	l,000H
	lda	X2067
	mov	h,a
	ret
;
L1618:
	lda	X2015
	cpi	0FFH
	rnz
	lxi	h,02010H
	mov	a,m
	inx	h
	mov	b,m
	ora	b
	rnz
	lda	X2025
	ana	a
	rnz
	lda	X20EF
	ana	a
	jz	L1652
	lda	X202D
	ana	a
	jnz	L1648
	call	L17C0
	ani	010H
	rz
	mvi	a,001H
	sta	X2025
	sta	X202D
	ret
;
L1648:
	call	L17C0
	ani	010H
	rnz
	sta	X202D
	ret
;
L1652:
	lxi	h,X2025
	mvi	m,001H
	lhld	X20ED
	inx	h
	mov	a,l
	cpi	07EH
	jc	L1663
	mvi	l,074H
L1663:
	shld	X20ED
	mov	a,m
	sta	X201D
	ret
;
L166B:
	stc
	ret
;
L166D:
	xra	a
	call	L1A8B
L1671:
	call	L1910
	mvi	m,000H
	call	L09CA
	inx	h
	lxi	d,020F5H
	ldax	d
	cmp	m
	dcx	d
	dcx	h
	ldax	d
	jz	L168B
	jnc	L1698
	jmp	L168F
;
L168B:
	cmp	m
	jnc	L1698
L168F:
	mov	a,m
	stax	d
	inx	d
	inx	h
	mov	a,m
	stax	d
	call	L1950
L1698:
	lda	X20CE
	ana	a
	jz	L16C9
	lxi	h,02803H
	lxi	d,01AA6H
	mvi	c,014H
	call	L0A93
	dcr	h
	dcr	h
	mvi	b,01BH
	lda	X2067
	rrc
	jc	L16B7
	mvi	b,01CH
L16B7:
	mov	a,b
	call	L08FF
	call	L0AB1
	call	L18E7
	mov	a,m
	ana	a
	jz	L16C9
	jmp	L02ED
;
L16C9:
	lxi	h,02D18H
	lxi	d,01AA6H
	mvi	c,00AH
	call	L0A93
	call	L0AB6
	call	L09D6
	xra	a
	sta	X20EF
	out	005H
	call	L19D1
	jmp	L0B89
;
L16E6:
	lxi	sp,02400H
	ei
	xra	a
	sta	X2015
L16EE:
	call	L14D8
	mvi	b,004H
	call	L18FA
	call	L0A59
	jnz	L16EE
	call	L19D7
	lxi	h,02701H
	call	L19FA
	xra	a
	call	L1A8B
	mvi	b,0FBH
	jmp	L196B
;
L170E:
	call	L09CA
	inx	h
	mov	a,m
	lxi	d,01CB8H
	lxi	h,01AA1H
	mvi	c,004H
	mov	b,a
L171C:
	ldax	d
	cmp	b
	jnc	L1727
	inx	h
	inx	d
	dcr	c
	jnz	L171C
L1727:
	mov	a,m
	sta	X20CF
	ret
;
L172C:
	lda	X2025
	cpi	000H
	jnz	L1739
	mvi	b,0FDH
	jmp	L19DC
;
L1739:
	mvi	b,002H
	jmp	L18FA
;
	nop
	nop
L1740:
	lxi	h,X209B
	dcr	m
	cz	L176D
	lda	X2068
	ana	a
	jz	L176D
	lxi	h,02096H
	dcr	m
	rnz
	lxi	h,X2098
	mov	a,m
	out	005H
	lda	X2082
	ana	a
	jz	L176D
	dcx	h
	mov	a,m
	dcx	h
	mov	m,a
	dcx	h
	mvi	m,001H
	mvi	a,004H
	sta	X209B
	ret
;
L176D:
	lda	X2098
L1770:
	ani	030H
	out	005H
	ret
;
L1775:
	lda	X2095
	ana	a
	jz	L17AA
	lxi	h,01A11H
	lxi	d,01A21H
	lda	X2082
L1785:
	cmp	m
	jnc	L178E
	inx	h
	inx	d
	jmp	L1785
;
L178E:
	ldax	d
	sta	X2097
	lxi	h,X2098
	mov	a,m
	ani	030H
	mov	b,a
	mov	a,m
	ani	00FH
	rlc
	cpi	010H
	jnz	L17A4
	mvi	a,001H
L17A4:
	ora	b
	mov	m,a
	xra	a
	sta	X2095
L17AA:
	lxi	h,X2099
	dcr	m
	rnz
	mvi	b,0EFH
	jmp	L19DC
;
	mvi	b,0EFH
	lxi	h,X2098
	mov	a,m
	ana	b
	mov	m,a
	out	005H
	ret
;
	nop
L17C0:
	lda	X2067
	rrc
	jnc	L17CA
	in	001H
	ret
;
L17CA:
	in	002H
	ret
;
L17CD:
	in	002H
	ani	004H
	rz
	lda	X209A
	ana	a
	rnz
	lxi	sp,02400H
	mvi	b,004H
L17DC:
	call	L09D6
	dcr	b
	jnz	L17DC
	mvi	a,001H
	sta	X209A
	call	L19D7
	ei
	lxi	d,01CBCH
	lxi	h,03016H
	mvi	c,004H
	call	L0A93
	call	L0AB1
	xra	a
	sta	X209A
	sta	X2093
	jmp	L16C9
;
L1804:
	lxi	h,X2084
	mov	a,m
	ana	a
	jz	L0707
	inx	h
	mov	a,m
	ana	a
	rnz
	mvi	b,001H
	jmp	L18FA
;
L1815:
	lxi	h,02810H
	lxi	d,01CA3H
	mvi	c,015H
	call	L08F3
	mvi	a,00AH
	sta	X206C
	lxi	b,01DBEH
L1828:
	call	L1856
	jc	L1837
	call	L1844
	jmp	L1828
;
	call	L0AB1
L1837:
	lxi	b,01DCFH
L183A:
	call	L1856
	rc
	call	L184C
	jmp	L183A
;
L1844:
	push	b
	mvi	b,010H
	call	L1439
	pop	b
	ret
;
L184C:
	push	b
	lda	X206C
	mov	c,a
	call	L0A93
	pop	b
	ret
;
L1856:
	ldax	b
	cpi	0FFH
	stc
	rz
	mov	l,a
	inx	b
	ldax	b
	mov	h,a
	inx	b
	ldax	b
	mov	e,a
	inx	b
	ldax	b
	mov	d,a
	inx	b
	ana	a
	ret
;
L1868:
	lxi	h,X20C2
	inr	m
	inx	h
	mov	c,m
	call	L01D9
	mov	b,a
	lda	X20CA
	cmp	b
	jz	L1898
	lda	X20C2
	ani	004H
	lhld	X20CC
	jnz	L1888
	lxi	d,00030H
	dad	d
L1888:
	shld	X20C7
	lxi	h,020C5H
	call	L1A3B
	xchg
	jmp	L15D3
;
	nop
	nop
	nop
L1898:
	mvi	a,001H
	sta	X20CB
	ret
;
L189E:
	lxi	h,02050H
	lxi	d,01BC0H
	mvi	b,010H
	call	L1A32
	mvi	a,002H
	sta	X2080
	mvi	a,0FFH
	sta	X207E
	mvi	a,004H
	sta	X20C1
L18B8:
	lda	X2055
	ani	001H
	jz	L18B8
L18C0:
	lda	X2055
	ani	001H
	jnz	L18C0
	lxi	h,03311H
	mvi	a,026H
	nop
	call	L08FF
	jmp	L0AB6
;
L18D4:
	lxi	sp,02400H
	mvi	b,000H
	call	L01E6
	call	L1956
L18DF:
	mvi	a,008H
	sta	X20CF
	jmp	L0AEA
;
L18E7:
	lda	X2067
	lxi	h,X20E7
	rrc
	rnc
	inx	h
	ret
;
L18F1:
	mvi	b,002H
	lda	X2082
	dcr	a
	rnz
	inr	b
	ret
;
L18FA:
	lda	X2094
	ora	b
	sta	X2094
	out	003H
	ret
;
L1904:
	lxi	h,02200H
	jmp	L01C3
;
L190A:
	call	L14D8
	jmp	L1597
;
L1910:
	lxi	h,X20E7
	lda	X2067
	rrc
	rc
	inx	h
	ret
;
L191A:
	mvi	c,01CH
	lxi	h,0241EH
	lxi	d,01AE4H
	jmp	L08F3
;
L1925:
	lxi	h,X20F8
	jmp	L1931
;
L192B:
	lxi	h,X20FC
	jmp	L1931
;
L1931:
	mov	e,m
	inx	h
	mov	d,m
	inx	h
	mov	a,m
	inx	h
	mov	h,m
	mov	l,a
	jmp	L09AD
;
L193C:
	mvi	c,007H
	lxi	h,03501H
	lxi	d,01FA9H
	jmp	L08F3
;
L1947:
	lda	X20EB
	lxi	h,03C01H
	jmp	L09B2
;
L1950:
	lxi	h,020F4H
	jmp	L1931
;
L1956:
	call	L1A5C
	call	L191A
	call	L1925
	call	L192B
	call	L1950
	call	L193C
	jmp	L1947
;
L196B:
	call	L19DC
	jmp	L1671
;
L1971:
	mvi	a,001H
	sta	X206D
	jmp	L16E6
;
L1979:
	call	L19D7
	call	L1947
	jmp	L193C
;
L1982:
	sta	X20C1
	ret
;
	adc	e
	dad	d
L1988:
	jmp	L09D6
;
	lxi	h,02803H
	lxi	d,019BEH
	mvi	c,013H
	jmp	L08F3
;
	nop
	nop
	nop
	nop
L199A:
	lda	X201E
	ana	a
	jnz	L19AC
	in	001H
	ani	076H
	sui	072H
	rnz
	inr	a
	sta	X201E
L19AC:
	in	001H
	ani	076H
	cpi	034H
	rnz
	lxi	h,02E1BH
	lxi	d,00BF7H
	mvi	c,009H
	jmp	L08F3
;
	db	028H
;
	inx	d
	nop
;
	db	008H
;
	inx	d
	mvi	c,026H
	stax	b
	mvi	c,011H
	rrc
	mvi	c,011H
	nop
	inx	d
;
	db	008H
;
	mvi	c,00DH
;
	db	028H
;
L19D1:
	mvi	a,001H
L19D3:
	sta	X20E9
	ret
;
L19D7:
	xra	a
	jmp	L19D3
;
	nop
L19DC:
	lda	X2094
	ana	b
	sta	X2094
	out	003H
	ret
;
L19E6:
	lxi	h,02701H
	jz	L19FA
L19EC:
	lxi	d,01C60H
	mvi	b,010H
	mov	c,a
	call	L1439
	mov	a,c
	dcr	a
	jnz	L19EC
L19FA:
	mvi	b,010H
	call	L14CB
	mov	a,h
	cpi	035H
	jnz	L19FA
	ret
;
L1A06:
	lxi	h,X2072
	mov	b,m
	ldax	d
	ani	080H
	xra	b
	rnz
	stc
	ret
;
	sta	X242B
	inr	e
	mvi	d,011H
	dcr	c
	ldax	b
;
	db	008H
;
	rlc
	mvi	b,005H
	inr	b
	inx	b
	stax	b
	lxi	b,02E34H
	daa
	shld	X181C
	dcr	d
	inx	d
;
	db	010H
;
	mvi	c,00DH
	inr	c
	dcx	b
	dad	b
	rlc
	dcr	b
	rst	7
L1A32:
	ldax	d
	mov	m,a
	inx	h
	inx	d
	dcr	b
	jnz	L1A32
	ret
;
L1A3B:
	mov	e,m
	inx	h
	mov	d,m
	inx	h
	mov	a,m
	inx	h
	mov	c,m
	inx	h
	mov	b,m
	mov	h,c
	mov	l,a
	ret
;
L1A47:
	push	b
	mvi	b,003H
L1A4A:
	mov	a,h
	rar
	mov	h,a
	mov	a,l
	rar
	mov	l,a
	dcr	b
	jnz	L1A4A
	mov	a,h
	ani	03FH
	ori	020H
	mov	h,a
	pop	b
	ret
;
L1A5C:
	lxi	h,02400H
L1A5F:
	mvi	m,000H
	inx	h
	mov	a,h
	cpi	040H
	jnz	L1A5F
	ret
;
L1A69:
	push	b
	push	h
L1A6B:
	ldax	d
	ora	m
	mov	m,a
	inx	d
	inx	h
	dcr	c
	jnz	L1A6B
	pop	h
	lxi	b,00020H
	dad	b
	pop	b
	dcr	b
	jnz	L1A69
	ret
;
L1A7F:
	call	L092E
	ana	a
	rz
	push	psw
	dcr	a
	mov	m,a
	call	L19E6
	pop	psw
L1A8B:
	lxi	h,02501H
	ani	00FH
	jmp	L09C5
;
	nop
	nop
	nop
	nop
	rst	7
	cmp	b
	cpi	020H
	inr	e
;
	db	010H
;
	sbb	m
	nop
;
	db	020H
;
	inr	e
;
	db	030H, 010H
;
	dcx	b
;
	db	008H
;
	rlc
	mvi	b,000H
	inr	c
	inr	b
	mvi	h,00EH
	dcr	d
	inr	b
	lxi	d,02626H
	rrc
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,02624H
	dcr	h
	dcx	d
	mvi	h,00EH
	lxi	d,01C26H
	rrc
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,02612H
	lxi	b,01314H
	inx	d
	mvi	c,00DH
	mvi	h,00EH
	dcr	c
	dcx	b
;
	db	018H
;
	mvi	h,01BH
	rrc
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,02626H
	lxi	b,01314H
	inx	d
	mvi	c,00DH
	mvi	h,026H
	stax	d
	stax	b
	mvi	c,011H
	inr	b
	inr	h
	dcx	d
	dcr	h
	mvi	h,007H
;
	db	008H
;
	cmc
	stax	d
	stax	b
	mvi	c,011H
	inr	b
	mvi	h,012H
	stax	b
	mvi	c,011H
	inr	b
	inr	h
	inr	e
	dcr	h
	mvi	h,001H
	nop
	nop
;
	db	010H
;
	nop
	nop
	nop
	nop
	stax	b
	mov	a,b
;
	db	038H
;
	mov	a,b
;
	db	038H
;
	nop
	rm
	nop
	nop
	add	b
	nop
	adc	m
	stax	b
	rst	7
	dcr	b
	inr	c
	mov	h,b
	inr	e
;
	db	020H, 030H, 010H
;
	lxi	b,X0000
	nop
	nop
	nop
	cmp	e
	inx	b
	nop
;
	db	010H
;
	sub	b
	inr	e
;
	db	028H, 030H
;
	lxi	b,00004H
	rst	7
	rst	7
	nop
	nop
X1B32:
	stax	b
	hlt
	inr	b
	nop
	nop
	nop
	nop
	nop
	inr	b
	xri	01CH
	nop
	nop
	inx	b
	nop
	nop
	nop
	ora	m
	inr	b
	nop
	nop
	lxi	b,01D00H
	inr	b
	jpo	L001C
	nop
	inx	b
	nop
	nop
	nop
	add	d
	mvi	b,000H
	nop
	lxi	b,01D06H
	inr	b
	rnc
	inr	e
	nop
	nop
	inx	b
	rst	7
	nop
	rnz
	inr	e
	nop
	nop
;
	db	010H
;
	lxi	h,00001H
;
	db	030H
;
	nop
	stax	d
	nop
	nop
	nop
	rrc
	dcx	b
	nop
;
	db	018H
;
	mvi	h,00FH
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,01B24H
	dcr	h
	cm	L0100
	rst	7
	rst	7
	nop
	nop
	nop
;
	db	020H
;
	mov	h,h
	dcr	e
	rnc
	dad	h
;
	db	018H
;
	stax	b
	mov	d,h
	dcr	e
	nop
;
	db	008H
;
	nop
	mvi	b,000H
	nop
	lxi	b,00040H
	lxi	b,X0000
;
	db	010H
;
	sbb	m
	nop
;
	db	020H
;
	inr	e
	nop
	inx	b
	inr	b
	mov	a,b
	inr	d
	inx	d
;
	db	008H
;
	ldax	d
	dcr	a
	mov	l,b
	cm	L68FC
	dcr	a
	ldax	d
	nop
	nop
	nop
	lxi	b,098B8H
	ana	b
	dcx	d
;
	db	010H
;
	rst	7
	nop
	ana	b
	dcx	d
	nop
	nop
	nop
	nop
	nop
;
	db	010H
;
	nop
	mvi	c,005H
	nop
	nop
	nop
	nop
	nop
	rlc
	rnc
	inr	e
	rz
	sbb	e
	inx	b
	nop
	nop
	inx	b
	inr	b
	mov	a,b
	inr	d
	dcx	b
	dad	d
	lda	XFA6D
	jm	L3A6D
	dad	d
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	lxi	b,X0000
	lxi	b,01F74H
	nop
	add	b
	nop
	nop
	nop
	nop
	nop
	inr	e
	cma
	nop
	nop
	inr	e
	daa
	nop
	nop
	inr	e
	dad	sp
	nop
	nop
	dad	sp
	mov	a,c
	mov	a,d
	mov	l,m
	cpe	LFAFA
	cpe	L7A6E
	mov	a,c
	dad	sp
	nop
	nop
	nop
	nop
	nop
	mov	a,b
	dcr	e
	cmp	m
	mov	l,h
	inr	a
	inr	a
	inr	a
	mov	l,h
	cmp	m
	dcr	e
	mov	a,b
	nop
	nop
	nop
	nop
	nop
	nop
	dad	d
	lda	XFA6D
	jm	L3A6D
	dad	d
	nop
	nop
	nop
	nop
	nop
	nop
;
	db	038H
;
	mov	a,d
	mov	a,a
	mov	l,l
	cpe	LFAFA
	cpe	L7F6D
	mov	a,d
;
	db	038H
;
	nop
	nop
	nop
	nop
	nop
	mvi	c,018H
	cmp	m
	mov	l,l
	dcr	a
	inr	a
	dcr	a
	mov	l,l
	cmp	m
;
	db	018H
;
	mvi	c,000H
	nop
	nop
	nop
	nop
	nop
	ldax	d
	dcr	a
	mov	l,b
	cm	L68FC
	dcr	a
	ldax	d
	nop
	nop
	nop
	nop
	nop
	nop
	rrc
	rar
	rar
	rar
	rar
	mov	a,a
	rst	7
	mov	a,a
	rar
	rar
	rar
	rar
	rrc
	nop
	nop
	inr	b
	lxi	b,00313H
	rlc
	ora	e
	rrc
	cma
	inx	b
	cma
	mov	c,c
	inr	b
	inx	b
	nop
	lxi	b,00840H
	dcr	b
	ana	e
	ldax	b
	inx	b
	mov	e,e
	rrc
	daa
	daa
	dcx	b
	mov	c,e
	mov	b,b
	add	h
	lxi	d,00F48H
	sbb	c
	inr	a
	mov	a,m
	dcr	a
	cmp	h
	mvi	a,07CH
	sbb	c
	daa
	dcx	d
	ldax	d
	mvi	h,00FH
	mvi	c,008H
	dcr	c
	inx	d
	stax	d
;
	db	028H
;
	stax	d
	stax	b
	mvi	c,011H
	inr	b
	mvi	h,000H
	inx	b
	dcr	d
	nop
	dcr	c
	stax	b
	inr	b
	mvi	h,013H
	nop
	lxi	b,0040BH
;
	db	028H
;
	stax	b
;
	db	010H, 020H, 030H
;
	inx	d
;
	db	008H
;
	dcx	b
	inx	d
	nop
;
	db	008H
;
	mov	c,c
	shld	X8114
	mov	b,d
	nop
	mov	b,d
	add	c
	inr	d
	shld	X0849
	nop
	nop
	mov	b,h
	xra	d
;
	db	010H
;
	adc	b
	mov	d,h
	shld	XAA10
	mov	b,h
	shld	X8854
	mov	c,d
	dcr	d
	cmp	m
	cmc
	mov	e,m
	dcr	h
	inr	b
	cm	L1004
	cm	L2010
	cm	L8020
	cm	L0080
	cpi	000H
	inr	h
	cpi	012H
	nop
	cpi	000H
	mov	c,b
	cpi	090H
	rrc
	dcx	b
	nop
	dad	h
	nop
	nop
	lxi	b,00107H
	lxi	b,00401H
	dcx	b
	lxi	b,00306H
	lxi	b,00B01H
	dad	b
	stax	b
;
	db	008H
;
	stax	b
	dcx	b
	inr	b
	rlc
	ldax	b
	dcr	b
	stax	b
	dcr	b
	inr	b
	mvi	b,007H
;
	db	008H
;
	ldax	b
	mvi	b,00AH
	inx	b
	rst	7
	rrc
	rst	7
	rar
	rst	7
	cmc
	rst	7
	mov	a,a
	rst	7
	rst	7
	cm	LF8FF
	rst	7
	rp
	rst	7
	rp
	rst	7
	rp
	rst	7
	rp
	rst	7
	rp
	rst	7
	rp
	rst	7
	rp
	rst	7
	rm
	rst	7
	cm	LFFFF
	rst	7
	rst	7
	rst	7
	rst	7
	mov	a,a
	rst	7
	cmc
	rst	7
	rar
	rst	7
	rrc
	dcr	b
;
	db	010H
;
	dcr	d
;
	db	030H
;
	sub	h
	sub	a
	sbb	d
	sbb	l
;
	db	010H
;
	dcr	b
	dcr	b
;
	db	010H
;
	dcr	d
;
	db	010H, 010H
;
	dcr	b
;
	db	030H, 010H, 010H, 010H
;
	dcr	b
	dcr	d
;
	db	010H
;
	dcr	b
	nop
	nop
	nop
	nop
	inr	b
	inr	c
	mvi	e,037H
	mvi	a,07CH
	mov	m,h
	mov	a,m
	mov	a,m
	mov	m,h
	mov	a,h
	mvi	a,037H
	mvi	e,00CH
	inr	b
	nop
	nop
	nop
	nop
	nop
	shld	XA500
	mov	b,b
;
	db	008H
;
	sbb	b
	dcr	a
	ora	m
	inr	a
	mvi	m,01DH
;
	db	010H
;
	mov	c,b
	mov	h,d
	ora	m
	dcr	e
	sbb	b
;
	db	008H
;
	mov	b,d
	sub	b
;
	db	008H
;
	nop
	nop
	mvi	h,01FH
	ldax	d
	dcx	d
	ldax	d
	ldax	d
	dcx	d
	rar
	ldax	d
	dcr	e
	ldax	d
	ldax	d
;
	db	010H, 020H, 030H
;
	mov	h,b
	mov	d,b
	mov	c,b
	mov	c,b
	mov	c,b
	mov	b,b
	mov	b,b
	mov	b,b
	rrc
	dcx	b
	nop
;
	db	018H
;
	stax	d
	rrc
	nop
	stax	b
	inr	b
	mvi	h,026H
;
	db	008H
;
	dcr	c
	dcr	d
	nop
	inx	b
	inr	b
	lxi	d,00E12H
	inr	l
	mov	l,b
	dcr	e
	inr	c
	inr	l
;
	db	020H
;
	inr	e
	ldax	b
	inr	l
	mov	b,b
	inr	e
;
	db	008H
;
	inr	l
	nop
	inr	e
	rst	7
	mvi	c,02EH
	rpo
	dcr	e
	inr	c
	mvi	l,0EAH
	dcr	e
	ldax	b
	mvi	l,0F4H
	dcr	e
;
	db	008H
;
	mvi	l,099H
	inr	e
	rst	7
	daa
;
	db	038H
;
	mvi	h,00CH
;
	db	018H
;
	stax	d
	inx	d
	inr	b
	lxi	d,02718H
	dcr	e
	ldax	d
	mvi	h,00FH
	mvi	c,008H
	dcr	c
	inx	d
	stax	d
	daa
	inr	e
	ldax	d
	mvi	h,00FH
	mvi	c,008H
	dcr	c
	inx	d
	stax	d
	nop
	nop
	nop
	rar
	inr	h
	mov	b,h
	inr	h
	rar
	nop
	nop
	nop
	mov	a,a
	mov	c,c
	mov	c,c
	mov	c,c
	mvi	m,000H
	nop
	nop
	mvi	a,041H
	mov	b,c
	mov	b,c
	shld	X0000
	nop
	mov	a,a
	mov	b,c
	mov	b,c
	mov	b,c
	mvi	a,000H
	nop
	nop
	mov	a,a
	mov	c,c
	mov	c,c
	mov	c,c
	mov	b,c
	nop
	nop
	nop
	mov	a,a
	mov	c,b
	mov	c,b
	mov	c,b
	mov	b,b
	nop
	nop
	nop
	mvi	a,041H
	mov	b,c
	mov	b,l
	mov	b,a
	nop
	nop
	nop
	mov	a,a
;
	db	008H, 008H, 008H
;
	mov	a,a
	nop
	nop
	nop
	nop
	mov	b,c
	mov	a,a
	mov	b,c
	nop
	nop
	nop
	nop
	stax	b
	lxi	b,00101H
	mov	a,m
	nop
	nop
	nop
	mov	a,a
;
	db	008H
;
	inr	d
	shld	X0041
	nop
	nop
	mov	a,a
	lxi	b,00101H
	lxi	b,X0000
	nop
	mov	a,a
;
	db	020H, 018H, 020H
;
	mov	a,a
	nop
	nop
	nop
	mov	a,a
;
	db	010H, 008H
;
	inr	b
	mov	a,a
	nop
	nop
	nop
	mvi	a,041H
	mov	b,c
	mov	b,c
	mvi	a,000H
	nop
	nop
	mov	a,a
	mov	c,b
	mov	c,b
	mov	c,b
;
	db	030H
;
	nop
	nop
	nop
	mvi	a,041H
	mov	b,l
	mov	b,d
	dcr	a
	nop
	nop
	nop
	mov	a,a
	mov	c,b
	mov	c,h
	mov	c,d
	lxi	sp,X0000
	nop
	sta	X4949
	mov	c,c
	mvi	h,000H
	nop
	nop
	mov	b,b
	mov	b,b
	mov	a,a
	mov	b,b
	mov	b,b
	nop
	nop
	nop
	mov	a,m
	lxi	b,00101H
	mov	a,m
	nop
	nop
	nop
	mov	a,h
	stax	b
	lxi	b,07C02H
	nop
	nop
	nop
	mov	a,a
	stax	b
	inr	c
	stax	b
	mov	a,a
	nop
	nop
	nop
	mov	h,e
	inr	d
;
	db	008H
;
	inr	d
	mov	h,e
	nop
	nop
	nop
	mov	h,b
;
	db	010H
;
	rrc
;
	db	010H
;
	mov	h,b
	nop
	nop
	nop
	mov	b,e
	mov	b,l
	mov	c,c
	mov	d,c
	mov	h,c
	nop
	nop
	nop
	mvi	a,045H
	mov	c,c
	mov	d,c
	mvi	a,000H
	nop
	nop
	nop
	lxi	h,0017FH
	nop
	nop
	nop
	nop
	inx	h
	mov	b,l
	mov	c,c
	mov	c,c
	lxi	sp,X0000
	nop
	mov	b,d
	mov	b,c
	mov	c,c
	mov	e,c
	mov	h,m
	nop
	nop
	nop
	inr	c
	inr	d
	inr	h
	mov	a,a
	inr	b
	nop
	nop
	nop
	mov	m,d
	mov	d,c
	mov	d,c
	mov	d,c
	mov	c,m
	nop
	nop
	nop
	mvi	e,029H
	mov	c,c
	mov	c,c
	mov	b,m
	nop
	nop
	nop
	mov	b,b
	mov	b,a
	mov	c,b
	mov	d,b
	mov	h,b
	nop
	nop
	nop
	mvi	m,049H
	mov	c,c
	mov	c,c
	mvi	m,000H
	nop
	nop
	lxi	sp,X4949
	mov	c,d
	inr	a
	nop
	nop
	nop
;
	db	008H
;
	inr	d
	shld	X0041
	nop
	nop
	nop
	nop
	mov	b,c
	shld	X0814
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	inr	d
	inr	d
	inr	d
	inr	d
	inr	d
	nop
	nop
	nop
	shld	X7F14
	inr	d
	shld	X0000
	nop
	inx	b
	inr	b
	mov	a,b
	inr	b
	inx	b
	nop
	nop
X1F50:
	inr	h
	dcx	d
	mvi	h,00EH
	lxi	d,01C26H
	mvi	h,00FH
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,02512H
	mvi	h,026H
;
X1F62:
	db	028H
;
	dcx	d
	mvi	h,00FH
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,02626H
	dcx	d
	mvi	h,002H
	mvi	c,008H
	dcr	c
	mvi	h,001H
	lxi	b,X0000
	lxi	b,00200H
	lxi	b,00200H
	lxi	b,06000H
;
	db	010H
;
	rrc
;
	db	010H
;
	mov	h,b
;
	db	030H, 018H
;
	ldax	d
	dcr	a
	mov	l,b
	cm	L68FC
	dcr	a
	ldax	d
	nop
;
	db	008H
;
	dcr	c
	stax	d
	inr	b
	lxi	d,02613H
	mvi	h,002H
	mvi	c,008H
	dcr	c
	dcr	c
	lhld	X1F50
	ldax	b
	lhld	X1F62
	rlc
	lhld	X1FE1
	rst	7
	stax	b
	lxi	d,00304H
;
	db	008H
;
	inx	d
	mvi	h,000H
	mov	h,b
;
	db	010H
;
	rrc
;
	db	010H
;
	mov	h,b
;
	db	038H
;
	dad	d
	lda	XFA6D
	jm	L3A6D
	dad	d
	nop
	nop
;
	db	020H
;
	mov	b,b
	mov	c,l
	mov	d,b
;
	db	020H
;
	nop
	nop
	nop
	nop
	nop
	rst	7
	cmp	b
	rst	7
	add	b
	rar
;
	db	010H
;
	sub	a
	nop
	add	b
	rar
	nop
	nop
	lxi	b,022D0H
;
	db	020H
;
	inr	e
;
	db	010H
;
	sub	h
	nop
;
	db	020H
;
	inr	e
;
X1FE1:
	db	028H
;
	inr	e
	mvi	h,00FH
	dcx	b
	nop
;
	db	018H
;
	inr	b
	lxi	d,02612H
	inr	e
	mvi	h,002H
	mvi	c,008H
	dcr	c
	stax	d
	rrc
	inr	d
	stax	d
	rlc
	mvi	h,000H
;
	db	008H, 008H, 008H, 008H, 008H
;
	nop
	nop
