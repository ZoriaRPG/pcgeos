##############################################################################
#
#	Copyright (c) GeoWorks 1992 -- All Rights Reserved
#
# PROJECT:	PC GEOS
# MODULE:	Impex- bmp Graphics Translation Library
# FILE:		bmp.gp
#
# AUTHOR:	Maryann Simmons 2/13/92
#
#
# Parameters file for:  
#
#	$Id: bmp.gp,v 1.1 97/04/07 11:26:31 newdeal Exp $
#
##############################################################################
#
# Permanent name
#
name bmp.lib
#
# Long name
#
longname "Bmp Translator"
# DB Token
#
tokenchars "TLGR"
tokenid 0
#
#
# Specify geode type
#
type	library, single
#
#define entry point
#
entry TransLibraryEntry
#

#
# Import library routine definitions
#
library	geos
library	ui
library	ansic
library math
library impex
library	dib

# Define resources other than standard discardable code
nosort
resource ResidentCode	read-only code shared
resource ExportCode	read-only code shared
resource ImportCode	read-only code shared
resource TransCommonCode	read-only code shared
#resource Math	        read-only code shared
#resource MAINEXPORTC	read-only code shared
#resource MAINIMPORTC	read-only code shared
#resource DIB	        read-only code shared
#resource FIXSHORT	read-only code shared
#resource HSIPORT	read-only code shared
#resource PACKBIT	read-only code shared
resource ExportUI	ui-object	read-only
resource FormatStrings	lmem shared read-only
#
export	TransGetImportUI
export	TransGetExportUI
export	TransInitImportUI
export	TransInitExportUI
export	TransGetImportOptions
export	TransGetExportOptions
export	TransImport
export	TransExport
export	TransGetFormat





