##############################################################################
#
#	Copyright (c) Geoworks 1991-92 -- All Rights Reserved
#
# PROJECT:	Sample Applications
# MODULE:	Document Control -- Default Document
# FILE:		defdoc.gp
#
# AUTHOR:	Tony Requist
#
# DESCRIPTION:	This file contains Geode definitions for the "DefDoc" sample
#		application. This file is read by the Glue linker to
#		build this application.
#
# RCS STAMP:
#	$Id: defdoc.gp,v 1.1 97/04/04 16:36:26 newdeal Exp $
#
##############################################################################
#
name defdoc.app
#
longname "C DefDoc"
#
type	appl, process
#
class	DDProcessClass
#
appobj	DDApp
#
tokenchars "SAMP"
tokenid 8
#
# Heapspace: This is roughly the non-discardable memory usage (in words)
# of the application and any transient libraries that it depends on,
# plus an additional amount for thread activity. To find the heapspace
# for an application, use the Swat "heapspace" command.
#
heapspace 4301
#
library	geos
library	ui
#
resource APPRESOURCE ui-object
resource INTERFACE ui-object
resource DOCUMENTUI object
#
# Exported entry points. To allow the relocation of the DOCUMENTUI resource
# to occur and be independent of insignificant (as far as the operation of
# the application is concerned) changes in the physical location of the
# DDDocumentClass class record, the relocation information for the
# GenDocumentGroup object specifies the class to use for document objects
# as an exported routine number for this application. Entry point numbers
# change far less frequently, and only for much greater cause, than the
# offsets of variables and routines.
#
export DDDocumentClass
