;	$Id: f_scopy.asm,v 1.1 97/04/07 12:04:20 newdeal Exp $
;[]-----------------------------------------------------------------[]
;|      F_SCOPY.ASM -- far struct copy routine                       |
;[]-----------------------------------------------------------------[]

;
;       C/C++ Run Time Library - Version 5.0
; 
;       Copyright (c) 1987, 1992 by Borland International
;       All Rights Reserved.
; 

                INCLUDE rules.asi

; calls to this routine are generated by the compiler to copy
; one "struct" value to another
;
; On entry:
;
;       CX      = Number of bytes to copy


_TEXT           SEGMENT
                ASSUME  CS:_TEXT

                public  SCOPY@
                public  F_SCOPY@

SCOPY@ proc far
	.fall_thru
SCOPY@ endp
F_SCOPY@ proc far
                push    bp
                mov     bp,sp
                push    si
                push    di
                push    ds
                lds     si,dword ptr 6[bp]
                les     di,dword ptr 10[bp]
                cld
                shr     cx, 1
                rep     movsw
                adc     cx, cx
                rep     movsb
                pop     ds
                pop     di
                pop     si
                pop     bp
                ret    8
F_SCOPY@ endp

_TEXT           ENDS

