
COMMENT }%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	Copyright (c) Berkeley Softworks 1990 -- All Rights Reserved


PROJECT:	PC GEOS
MODULE:		printer drivers
FILE:		pageEndLF.asm

AUTHOR:		Dave Durran

ROUTINES:
	Name		Description
	----		-----------
	PrintEndPage	Tidy up the page-related variables, called once/page
			by EXTERNAL at end of page.

REVISION HISTORY:
	Name	Date	Description
	----	----	-----------
	Dave	3/90	initial version
	Dave	3/92	copied from epson24Page.asm

DESCRIPTION:

	$Id: pageEndLF.asm,v 1.1 97/04/18 11:51:41 newdeal Exp $

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}


COMMENT }%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		PrintEndPage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SYNOPSIS:	Use LFs to get to the next TOF, clean up , and exit page.

CALLED BY:	GLOBAL

PASS:		bp	- PSTATE segment address.
		cl	- Suppress form feed flag, C_FF is FF non-suppressed

RETURN:		

DESTROYED:

PSEUDO CODE/STRATEGY:

KNOWN BUGS/SIDE EFFECTS/IDEAS:
	nothing

REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	Dave	3/90		Initial version

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

PrintEndPage	proc	far
	uses	ax,cx, es, dx
	.enter

	mov	es, bp

		;get rid of more than 1 integral form length.

	clr	ax
	mov	dx,es:PS_customHeight	;get the paper size in Y.
	call	PrConvertToDriverCoordinates
	mov	ax,es:PS_cursorPos.P_y	;get the current Y pos.

checkIfMoreThanPage:
	sub	ax,dx			;subtract a paper size
	js	nosub
	mov	es:PS_cursorPos.P_y,ax	;set the current Y pos.
	jmp	checkIfMoreThanPage

nosub:
		; see if the spooler is in the suppress formfeed mode.
	cmp	cl,C_FF
	jne	suppressformfeed

		; send a form feed to the bugger
	test	es:PS_paperInput,mask PIO_TRACTOR
	jnz	newFormFeed
	mov	cl,C_FF		;a form-feed is pre loaded.
	call	PrintStreamWriteByte
	jmp	formFeedOut

newFormFeed:
	mov	dx,es:PS_customHeight	;get the paper size in Y.
	clr	ax
	call	PrConvertToDriverCoordinates
	sub	dx,es:PS_cursorPos.P_y	;subtract the current Y pos.
	call	PrLineFeed		;hand line-feed it to next TOF.

formFeedOut:
	jc	exit

		; make sure all the styles are reset at the printer for 
		; the next page.  Use version that doesn't care about
		; NLQ mode, since we want to biff it

	call	PrintClearStyles	; set clear styles @ printer
	jmp	exit

suppressformfeed:
                ; If in graphics mode, everything is OK....
        cmp     es:PS_mode,PM_FIRST_TEXT_MODE
        jge      toascii

	clc		;get rid of any error generated by cmp.
	jmp	exit

toascii:
        mov     dx,es:PS_curFont.FE_size ;load the current font size.
        add     dx,es:PS_cursorPos.P_y  ;add to current position.
        mov     cx,0		       ;return to left margin.
	mov	ax,cx
	mov	si,cx
        call    PrintSetCursor  ;do line feed of the correct length.

exit:
	.leave
	ret
PrintEndPage	endp
