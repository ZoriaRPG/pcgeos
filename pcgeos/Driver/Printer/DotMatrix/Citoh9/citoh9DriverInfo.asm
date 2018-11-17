COMMENT @%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	Copyright (c) Berkeley Softworks 1990 -- All Rights Reserved

PROJECT:	PC GEOS
MODULE:		citoh 9-pin printer driver
FILE:		citoh9DriverInfo.asm

AUTHOR:		Dave Durran, 27 Feb 1990

	
REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	Dave	2/27/90		Initial revision
	Dave	5/92		Initial 2.0 version

DESCRIPTION:
	Driver info for the citoh 9-pin printer driver

	The file "printerDriver.def" should be included before this one
		

	$Id: citoh9DriverInfo.asm,v 1.1 97/04/18 11:53:31 newdeal Exp $

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@


COMMENT @%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		Driver Info Resource

	This part of the file contains the information that pertains to
	all device supported by the driver.  It includes device names and
	a table of the resource handles for the specific device info.  A
	pointer to this info is provided by the DriverInfo function.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@

DriverInfo	segment	lmem LMEM_TYPE_GENERAL

;----------------------------------------------------------------------------
;	Device Enumerations
;----------------------------------------------------------------------------

DefPrinter	PD_APPLE_DMP, "Apple DMP", dmpInfo
DefPrinter	PD_APPLE_IW2, "Apple ImageWriter II (Color)", iwriter2Info
DefPrinter	PD_CITOH_8510, "C.Itoh 8510", generInfo
DefPrinter	PD_CITOH_8510A, "C.Itoh 8510A", dmpInfo
DefPrinter	PD_NEC_8023, "NEC 8023", generInfo
DefPrinter	PD_NEC_8025, "NEC 8025", generwInfo
DefPrinter	PD_TOSHIBA_7253, "Toshiba PA 7253", generInfo



;----------------------------------------------------------------------------
;	Driver Info Header
;----------------------------------------------------------------------------

DriverExtendedInfoTable			 < {}, 		; lmem hdr
					   PrintDevice/2,	; # devices
					   offset deviceStrings, ; devices
					   offset deviceInfoTab	; info blocks
					   >

PrintDriverInfo				 < 60,			; timeout (sec)
					   PR_DONT_RESEND,
                                           isoSubstitutions,    ;ISO sub tab.
                                           asciiTransTable,
                                           PDT_PRINTER,
                                           TRUE
					>

;----------------------------------------------------------------------------
;       Device String Table and Strings
;----------------------------------------------------------------------------

        ;ISO Substitutions for this printer.
        ;France,Germany,UK,Denmark1,Sweden,Italy,Spain1,Japan,Norway
isoSubstitutions        chunk.word \
                2424h,4088h,5ba1h,5c8dh,5da4h,5e5eh,6060h,7b8eh,\
                7c9dh,7d8fh,7each,0000h,0000h,0000h,0000h,0000h,\
                2424h,40a4h,5b80h,5c85h,5d86h,5e5eh,6060h,7b8ah,\
                7c9ah,7d9fh,7ea7h,0000h,0000h,0000h,0000h,0000h,\
                24a3h,0000h,0000h,0000h,0000h,0000h,0000h,0000h,\
                0000h,0000h,0000h,0000h,0000h,0000h,0000h,0000h,\
                2424h,4040h,5baeh,5cafh,5d81h,5e5eh,6060h,7bbeh,\
                7cbfh,7d8ch,0000h,0000h,0000h,0000h,0000h,0000h,\
                24dbh,4083h,5b80h,5c85h,5d81h,5e86h,608eh,7b8ah,\
                7c9ah,7d8ch,7e9fh,0000h,0000h,0000h,0000h,0000h,\
                2424h,4040h,5ba1h,5c5ch,5d8eh,5e5eh,609dh,7b88h,\
                7c98h,7d8fh,7e93h,0000h,0000h,0000h,0000h,0000h,\
                2424h,4040h,5bc1h,5c84h,5dc2h,5e5eh,6060h,7bach,\
                7c96h,0000h,0000h,0000h,0000h,0000h,0000h,0000h,\
                2424h,4040h,5b5bh,5cb4h,0000h,0000h,0000h,0000h,\
                0000h,0000h,0000h,0000h,0000h,0000h,0000h,0000h,\
                24dbh,4083h,5baeh,5cafh,5d81h,5e86h,608eh,7bbeh,\
                7cbfh,7d8ch,7e9fh,0000h,0000h,0000h,0000h,0000h


        ; ASCII Translation List for Foreign Language Versions
asciiTransTable         chunk.char ";;",0

;create the actual tables.
PrinterTables

DriverInfo	ends
