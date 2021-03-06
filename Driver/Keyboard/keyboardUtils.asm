COMMENT @%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	Copyright (c) GeoWorks 1990 -- All Rights Reserved

PROJECT:	PC GEOS
MODULE:		Keyboard Driver
FILE:		keyboardUtils.asm

AUTHOR:		Gene Anderson, Feb  8, 1990

ROUTINES:
	Name			Description
	----			-----------
	KbdIsCharOnKey		check if character can be generated by key
	KbdMapKey		return all possible characters from key
	KbdCheckShortcut	see if keypress is a shortcut
	
REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	Gene	2/ 8/90		Initial revision

DESCRIPTION:
	Contains keyboard driver utility routines
		
	$Id: keyboardUtils.asm,v 1.1 97/04/18 11:47:07 newdeal Exp $

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@

Resident	segment	resource


COMMENT @%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		KbdMapKey
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SYNOPSIS:	Return all possible characters from given key.
CALLED BY:	KbdStrategy - DR_KBD_MAP_KEY

PASS:		es:si - ptr to KeyMapStruct to fill in
		al - scan code of key to map
		(ds - idata)
RETURN:		es:si - KeyMapStruct filled in
DESTROYED:	none

PSEUDO CODE/STRATEGY:
KNOWN BUGS/SIDE EFFECTS/IDEAS:
	Assumes: size(KeyDef) = 4
	Assumes: size(ExtendedDef) = 8
REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	eca	2/ 8/90		Initial version

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@

KbdMapKey	proc	near
	uses	ax, cx, di, si
	.enter
	mov	di, si				;di <- ptr to return buffer
	push	ax, di
	clr	al				;al <- byte to store = 0
	mov	cx, size KeyMapStruct		;cx <- # of bytes to store
	rep	stosb				;clear the buffer
	pop	ax, di
	dec	al				;scan codes start at 1
	clr	ah
if DBCS_PCGEOS
		CheckHack <(size KeyDef) eq 8>
	shl	ax, 1
else
		CheckHack <(size KeyDef) eq 4>
endif
	shl	ax, 1
	shl	ax, 1				;*4 for each KeyDef
	mov	si, ax				;si <- offset to KeyDef
if DBCS_PCGEOS
	mov	ax, ds:KbdKeyDefTable[si].KD_char
	mov	es:[di].KMS_char, ax		;store unshifted char
	mov	ax, ds:KbdKeyDefTable[si].KD_shiftChar
	mov	es:[di].KMS_shift, ax		;store shifted char
else
	mov	al, ds:KbdKeyDefTable[si].KD_char
	mov	es:[di].KMS_char, al		;store unshifted char
	mov	al, ds:KbdKeyDefTable[si].KD_shiftChar
	mov	es:[di].KMS_shift, al		;store shifted char
endif
	mov	al, ds:KbdKeyDefTable[si].KD_keyType
	mov	es:[di].KMS_keyType, al		;store key type
	test	al, KD_EXTENDED			;see if extended
	jz	notExtended			;branch if not extended
	mov	al, ds:KbdKeyDefTable[si].KD_extEntry	;al <- index of ext.
	clr	ah
if DBCS_PCGEOS
		CheckHack <(size ExtendedDef) eq 16>
	shl	ax, 1
else
		CheckHack <(size ExtendedDef) eq 8>
endif
	shl	ax, 1
	shl	ax, 1
	shl	ax, 1				;*8 for each ExtendedDef
	mov	si, ax				;si <- offset of ExtendedDef
SBCS <	mov	al, ds:KbdExtendedDefTable[si].EDD_charSysFlags		>
SBCS <	ornf	es:[di].KMS_virtual, al		;indicate which are virtual >
	push	di
	add	si, offset KbdExtendedDefTable.EDD_ctrlChar
						;ds:si <- source
	add	di, offset KMS_ctrl		;es:di <- return buffer
	mov	cx, NUM_EXTENDED_CHARS		;cx <- # bytes to move
SBCS <	rep	movsb				;copy to return buffer	>
DBCS <	rep	movsw				;copy to return buffer	>
	pop	di
notExtended:
if DBCS_PCGEOS
	; KMS_virtual not needed for DBCS
else
	mov	al, es:[di].KMS_keyType
	and	al, KD_TYPE			;al <- key type
	cmp	al, KEY_ALPHA
	je	notVirtual			;branch if alpha key
	cmp	al, KEY_NONALPHA
	je	notVirtual			;branch if non-alpha key
	ornf	es:[di].KMS_virtual, EV_KEY or EV_SHIFT	;mark base chars
notVirtual:
endif
	.leave
	ret
KbdMapKey	endp


COMMENT @%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		IsCharOnKey
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SYNOPSIS:	See if character can be generated by given key.
CALLED BY:	KbdCheckShortcut

PASS:		al - character to check (Chars or VChar)
		ah:0-3 - character set (low 4 bits of CharacterSet)
		dh - scan code of key to check
		es - seg addr of idata
RETURN:		if carry set:
		    character can be generated by key
		    dl:4-6 - modifiers used to generate char (KeyModifiers)
		    dl:0-2 - modifiers used to generate char (KeyModifiers)
		    bh - key type (KeyDataFlags)
DESTROYED:	none

PSEUDO CODE/STRATEGY:
	assumes: size(KeyDef) = 4
	assumes: size(ExtendedDef) = 8
	Does goofy stuff with the modifiers; shift is bit 0, ctrl is
	bit 1, and alt is bit 2, so the corresponding bits OR'd
	together will give an index of the corresponding character
	in the extended entry, if any. Two copies of those bits are
	kept, one in bits 0-2, and one in bits 4-6 to return w/o shifting.
KNOWN BUGS/SIDE EFFECTS/IDEAS:
	Uses es for the seg addr of idata because that's convienent
	for KbdCheckShortcut, which calls this (potentially) for
	each shortcut in its table. Returns 2 copies of the modifier
	bits for the same reason.
REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	eca	2/ 8/90		Initial version

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@

IsCharOnKey	proc	near
	uses	ax, cx, di
	.enter
SBCS <	and	ah, (KSS_CHAR_SET shr 8)	;ignore high 4 bits	>
DBCS <	andnf	ax, mask KS_CHAR		;ignore high 4 bits	>
DBCS <	cmp	ah, CS_CONTROL_HB and 0xf	;control key?		>
DBCS <	je	isCtrlKey			;branch if control key	>
DBCS <afterCtrlCheck:							>
	mov	cl, dh
	mov	di, cx
	and	di, 0x00ff			;di <- index of KeyDef
	dec	di				;scan codes start at 1
if DBCS_PCGEOS
		CheckHack <(size KeyDef) eq 8>
	shl	di, 1
else
		CheckHack <(size KeyDef) eq 4>
endif
	shl	di, 1
	shl	di, 1				;*4 for each KeyDef
	clr	dl				;dl <- no modifiers
	mov	bh, es:KbdKeyDefTable[di].KD_keyType
SBCS <	cmp	es:KbdKeyDefTable[di].KD_char, al	;see if unshifted >
DBCS <	cmp	es:KbdKeyDefTable[di].KD_char, ax	;see if unshifted >
	je	checkChar				;branch if match
SBCS <	cmp	es:KbdKeyDefTable[di].KD_shiftChar, al	;see if shifted >
DBCS <	cmp	es:KbdKeyDefTable[di].KD_shiftChar, ax	;see if shifted >
	je	checkShiftChar				;branch if match
	test	bh, KD_EXTENDED			;see if extended
	jz	noMatch				;if not extended, we're done

	mov	di, {word}es:KbdKeyDefTable[di].KD_extEntry
	and	di, 0x00ff			;di <- index of extended entry
if DBCS_PCGEOS
		CheckHack <(size ExtendedDef) eq 16>
	shl	di, 1
else
		CheckHack <(size ExtendedDef) eq 8>
endif
	shl	di, 1
	shl	di, 1
	shl	di, 1				;*8 for each ExtendedDef
	ornf	dl, (mask KMS_CTRL) or \
		    (mask KMS_CTRL shl 4)	;dl <- at least <ctrl> used
	push	di				;save offset of entry
	mov	cx, NUM_EXTENDED_CHARS		;cx <- # of entries
extLoop:
SBCS < 	cmp	es:KbdExtendedDefTable.EDD_ctrlChar[di], al		>
DBCS < 	cmp	es:KbdExtendedDefTable.EDD_ctrlChar[di], ax		>
	je	checkExtChar			;branch if a match
	inc	di				;advance to next char
DBCS <	inc	di				;char is word
	add	dl, 00010001b			;add next modifiers
	loop	extLoop				;check next entry
	pop	di
	jmp	noMatch				;if through loop, no match

;	
; Matches standard char, make sure it's of the right type
;

checkShiftChar:
	ornf	dl, (mask KMS_SHIFT) or \
		    (mask KMS_SHIFT shl 4)	;dl <- <shift> was used
checkChar:
if DBCS_PCGEOS
	jmp	foundChar
else
	mov	cl, bh				;cl <- key type
	andnf	cl, KD_TYPE			;keep only type bits
	cmp	ah, (CS_BSW and mask KS_CHAR_SET) ;looking for printable?
	jne	charIsVirtual			;no, do other checks

	cmp	cl, KEY_ALPHA			;see if alphabetic
	je	foundChar
	cmp	cl, KEY_NONALPHA		;see if other printable char
	je	foundChar
	jmp	noMatch				;not printable, no match

charIsVirtual:
	cmp	cl, KEY_MISC			;see if miscellaneous
	je	foundChar			;yes, it's virtual
	cmp	cl, KEY_ALPHA			;see if alphabetic
	je	noMatch				;yes, not virtual
	cmp	cl, KEY_NONALPHA		;see if other printable char
	je	noMatch				;yes, not virtual
	jmp	foundChar			;else it's virtual & a match
endif

;
; Matches extended char, make sure it's of the right type
;
checkExtChar:
if DBCS_PCGEOS
	pop	di
else
	mov	di, dx				;dl == modifiers used
	and	di, 0x000f			;si <- index of char
	mov	al, es:bitTable[di]		;al <- corresponding bit
	pop	di				;di <- offset of ext entry
	test	es:KbdExtendedDefTable[di].EDD_charSysFlags, al
	jnz	extIsVirtual			;branch if entry virtual
	cmp	ah, (CS_BSW and mask KS_CHAR_SET) ;looking for virtual?
	jne	noMatch				;yes, then didn't match
	jmp	foundChar			;no, we found a match
extIsVirtual:
	cmp	ah, (CS_BSW and mask KS_CHAR_SET) ;looking for virtual?
	je	noMatch				;no, then didn't match
endif
foundChar:
	andnf	dl, 0xf0			;keep only bits 4-7
	stc					;indicate match found
done:
	.leave
	ret

DBCS <isCtrlKey:							>
DBCS <	mov	ah, CS_CONTROL_HB					>
DBCS <	jmp	afterCtrlCheck						>

noMatch:
	clc					;indicate no match found
	jmp	done
IsCharOnKey	endp


COMMENT @%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		KbdCheckShortcut
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SYNOPSIS:	See if a keypress is a shortcut.
CALLED BY:	KbdStrategy - DR_KBD_CHECK_SHORTCUT

PASS:		same as MSG_META_KBD_CHAR:
			cl - Character		(Chars or VChar)
			ch - CharacterSet	(CS_BSW or CS_CONTROL)
			dl - CharFlags
			dh - ShiftState		(left from conversion)
			bp low - ToggleState
			bp high - scan code
		ax - number of entries in table
		es:si - ptr to shortcut table (KeyboardShortcut)
		(ds - idata)

RETURN:		si - index of shortcut
		carry - set if a shortcut
DESTROYED:	none

PSEUDO CODE/STRATEGY:
	Assumes: size(KeyboardShortcut) = 2
	Assumes: high 4 bits of CharacterSet can be ignored
	Assumes: physical bit = 0 means match character
	Assumes: low bit of ShiftState is unused
	foreach KeyboardShortcut {
	    if (physical key) {
		if (shortcut char == key[scancode w/modifiers]) {
		    if (shortcut mods == (necessary keys+ShiftState) {
			return(index);
		    }
		}
	    } else {
		if (shortcut char == Character) {
		    if (ShiftState == shortcut modifiers)
			return(index);
		}
	    }
	}
REGISTER USAGE:
	constant:
		ds = seg addr of shortcut table
		es = seg addr of keyboard map (idata)
		di:12-15 = left over modifiers
		di:8-11  = CharacterSet
		di:0-7   = Character
		dh = scan code of char
		bl:4-6 = implied modifiers from key + left over modifiers
		bp:0-7 = CharFlags (passed dl)
		bp:8-15 = ShiftState (passed dh)
	in the loop:
		ax = current shortcut (KeyboardShortcut)
		si = offset of current shortcut
		cx = # of shortcuts left to check
		dl = implied modifiers from shortcut character
		bh = key type of modifier

KNOWN BUGS/SIDE EFFECTS/IDEAS:
REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	eca	2/16/90		Initial version

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@

CheckHack <(size KeyboardShortcut) eq (size word)>
;
; Verify low bit of ShiftState is unused
;
CheckHack <(mask CharFlags and 40h) eq 0>

KCS_NUMLOCK_FLAG	equ 	40h

KbdCheckShortcut	proc	near
	uses	ax, bx, cx, dx, bp, di, ds, es

SBCS <	cmp	ch, CS_UI_FUNCS			;UI function?		>
SBCS <	clc					;carry <- not a shortcut >
SBCS <	je	exit				;exit if UI function	>

	.enter

	push	si
	xchg	ax, cx				;cx <- # of entries
if DBCS_PCGEOS
	cmp	ah, CS_CONTROL_HB		;control key?
	je	isCtrlKey			;branch if control key
	andnf	ax, mask KS_CHAR		;ignore 4 high bits
	test	ax, not (mask KS_CHAR)		;potential shortcut?
	jnz	noMatch				;branch if not
afterCtrlKey:
else
	and	ah, (KSS_CHAR_SET shr 8)	;ignore 4 high bits of ah
endif
	push	ds
	segmov	ds, es, bx			;ds <- seg addr of table
	pop	es				;es <- seg addr of idata

	;
	;  load up bx with important info
	mov	bx, bp				;bl <- ToggleState
	xchg	bh, dh				;bh <- shifstate
						;dh <- scan code

	;
	; OR in the modifier keys that were left over
	;
	ornf	ah, (mask KMS_SHIFT or mask KMS_CTRL or mask KMS_ALT) shl 4

						;see if SHIFT left over
	test	bx, (SHIFT_KEYS shl 8) or TOGGLE_SHIFTSTICK
	jnz	shift
	andnf	ah, not (mask KMS_SHIFT shl 4)	;mark as not SHIFT'd
shift:
						;see if CTRL left over
	test	bx, (CTRL_KEYS shl 8) or TOGGLE_CTRLSTICK
	jnz	ctrl
	andnf	ah, not (mask KMS_CTRL shl 4)	;mark as not CTRL'd
ctrl:
	test	bx, (ALT_KEYS shl 8) or TOGGLE_ALTSTICK
	jnz	alt
	andnf	ah, not (mask KMS_ALT shl 4)	;mark as not ALT'd
alt:
	;
	; Find out the implied modifier keys for this keypress
	;
	xchg	bh, dh				; bh <- scan code
						; dh <- shiftstate
	mov	bp, dx				;bp <- CharFlags, ShiftState
	mov	dh, bh				;dh <- scan code
	call	IsCharOnKey			;find any other modifiers

	;
	; If the <CapsLock> key was down, toggle the shift state
	; if the key was of the right type.
	;
	test	bl, TOGGLE_CAPSLOCK
	jnz	checkCapslock			;branch if <CapsLock> down
afterCapslock:
	;
	; If the <NumLock> key was down, note the fact in the low bit of the
	; ShiftState which is in bp:8-15.
	;
	test	bl, TOGGLE_NUMLOCK
	jnz	checkNumlock			;branch if <NumLock> down
afterNumlock:

	ornf	ah, dl				;ah <- implied + leftover mods
	mov	di, ax				;di <- character value
	mov	bl, ah				;bl <- implied + leftover

shortcutLoop:
	lodsw					;ax <- shortcut
if DBCS_PCGEOS
PrintMessage <remove temporary check in KbdCheckShortcut>
	push	ax
	andnf	ax, mask KS_CHAR
	cmp	ax, ' '
	ERROR_B	KBD_BAD_SHORTCUT
	pop	ax
endif
	test	ax, KSS_PHYSICAL		;see if matching key or char
	jnz	physicalKey			;branch if matching key
	cmp	ax, di				;see if char, modifiers match
	je	match				;a match!
nextShortcut:
	loop	shortcutLoop			;branch while more

DBCS <noMatch:								>
	pop	ax				;clean up stack
	clc					;<- indicate not a shortcut
	jmp	done
match:
	pop	ax				;ax <- offset of table start
	sub	si, ax				;get offset from start
	sub	si, (size KeyboardShortcut)	;back up one entry
	stc					;<- indicate a shortcut
done:
	.leave
SBCS <exit:								>
	ret

if DBCS_PCGEOS
	;
	; For DBCS, we special-case control characters because the
	; allotted values for them do not fit in the scheme for
	; shortcuts of having values < 0x1000 (which is so we can
	; fit them in 12 bits).
	;
isCtrlKey:
	mov	ah, CS_CONTROL_HB and 0x0f
	jmp	afterCtrlKey
endif

checkCapslock:
	andnf	bh, KD_TYPE			;bh <- KeyTypeFlag
	cmp	bh, KEY_ALPHA
	jne	afterCapslock			;branch if not alphabetic
	xornf	dl, (mask KMS_SHIFT shl 4)	;toggle shift state
	jmp	afterCapslock

checkNumlock:
	ornf	bp, KCS_NUMLOCK_FLAG		;bp <- mark <NumLock> as down
	jmp	afterNumlock

physicalKey:
	;
	; The shortcut says to match keys, not characters. See if the
	; shortcut character is even on the key.
	;
	call	IsCharOnKey			;see if shortcut on key
	jnc	nextShortcut			;nope, try next entry
	;
	; The character can be generated by that key. Take the implied
	; modifiers (dl) plus the modifiers listed for the shortcut (ah),
	; and see if those match the modifiers for the keypress
	; plus any implied modifiers for it (bl)
	;
	and	ah, not (KSS_PHYSICAL shr 8)	;ignore physical flag
	or	dl, ah				;dl <- listed + implied mods
	cmp	dl, bl				;see if modifiers match
	jne	nextShortcut			;branch if no match
	;
	; The modifiers matched.  We now do some extra checking if the
	; key is part of the numeric keypad, where things are strange:
	;	- keys are overloaded (eg. <Home>/<7>
	;	- keys are sometimes redundant (eg. <Home>, <Home>/<7>)
	;	- there is a special state key (ie. <NumLock>)
	;
	; bp:0-7 = CharFlags for press
	; bp:8-15 = ShiftState for press
	; bh = KeyDataFlags for key being checked
	;
	; If the key in question is not of type KEY_PAD, it isn't affected
	; by the <NumLock> key, so no further checking needs to be done
	;
	andnf	bh, KD_TYPE			;bh <- KeyTypeFlag
	cmp	bh, KEY_PAD			;on numeric keypad?
	jne	match				;match if not
	;
	; If the keypress is from one of the extended keys, it isn't affected
	; by the <NumLock> key, so no further checking needs to be done.
	;
	test	bp, mask CF_EXTENDED		;extended key?
	jnz	match				;match if so
	;
	; The key is on the numeric keypad.  Make sure there aren't any
	; modifiers down -- if so, no further checking needs to be done.
	;
	test	bp, (CTRL_KEYS or ALT_KEYS or SHIFT_KEYS) shl 8
	jnz	match				;match if so
	;
	; Finally, see if the <NumLock> key was down.  If not, then this
	; was a match
	;
	test	bp, KCS_NUMLOCK_FLAG
	jz	match				;branch if no <NumLock>
	;
	; After narrowing down all the above conditions, we know that:
	;	- the key is on the numeric keypad
	;	- the key is unmodified
	;	- the <NumLock> key is down
	; An example of this is pressing the <Home>/<7> key when the
	; <NumLock> key is down.  In this case the press means <7>, so
	; it shouldn't match something with <Shift><Home> as a shortcut.
	;
	jmp	nextShortcut

KbdCheckShortcut	endp

Resident	ends
