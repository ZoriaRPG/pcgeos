ASMTOOLS.obj \
ASMTOOLS.eobj: ASMTOOLS/ASMTOOLSMANAGER.ASM \
                STDAPP.DEF GEOS.DEF GEODE.DEF RESOURCE.DEF EC.DEF LMEM.DEF \
                OBJECT.DEF GRAPHICS.DEF FONTID.DEF FONT.DEF COLOR.DEF \
                GSTRING.DEF TEXT.DEF CHAR.DEF HEAP.DEF UI.DEF FILE.DEF \
                VM.DEF WIN.DEF INPUT.DEF HWR.DEF LOCALIZE.DEF SLLANG.DEF \
                OBJECTS/PROCESSC.DEF OBJECTS/METAC.DEF CHUNKARR.DEF \
                GEOWORKS.DEF GCNLIST.DEF TIMEDATE.DEF \
                OBJECTS/TEXT/TCOMMON.DEF STYLESH.DEF IACP.DEF \
                OBJECTS/UIINPUTC.DEF OBJECTS/VISC.DEF OBJECTS/VCOMPC.DEF \
                OBJECTS/VCNTC.DEF INTERNAL/VUTILS.DEF OBJECTS/GENC.DEF \
                DISK.DEF DRIVE.DEF UDIALOG.DEF OBJECTS/GINTERC.DEF \
                TOKEN.DEF OBJECTS/CLIPBRD.DEF OBJECTS/GSYSC.DEF \
                OBJECTS/GPROCC.DEF ALB.DEF OBJECTS/GFIELDC.DEF \
                OBJECTS/GSCREENC.DEF OBJECTS/GFSELC.DEF \
                OBJECTS/GVIEWC.DEF OBJECTS/GCONTC.DEF OBJECTS/GCTRLC.DEF \
                OBJECTS/GDOCC.DEF OBJECTS/GDOCCTRL.DEF \
                OBJECTS/GDOCGRPC.DEF OBJECTS/GEDITCC.DEF \
                OBJECTS/GVIEWCC.DEF OBJECTS/GTOOLCC.DEF \
                OBJECTS/GPAGECC.DEF OBJECTS/GPENICC.DEF \
                OBJECTS/GGLYPHC.DEF OBJECTS/GTRIGC.DEF \
                OBJECTS/GBOOLGC.DEF OBJECTS/GITEMGC.DEF \
                OBJECTS/GDLISTC.DEF OBJECTS/GITEMC.DEF OBJECTS/GBOOLC.DEF \
                OBJECTS/GDISPC.DEF OBJECTS/GDCTRLC.DEF OBJECTS/GPRIMC.DEF \
                OBJECTS/GAPPC.DEF OBJECTS/GTEXTC.DEF OBJECTS/GGADGETC.DEF \
                OBJECTS/GVALUEC.DEF OBJECTS/GTOOLGC.DEF \
                INTERNAL/GUTILS.DEF OBJECTS/HELPCC.DEF OBJECTS/EMENUC.DEF \
                OBJECTS/EMOMC.DEF OBJECTS/EMTRIGC.DEF INTERNAL/UPROCC.DEF
BMP.obj \
BMP.eobj: EXTGRAPH.GOH OBJECTS/WINC.GOH OBJECTS/METAC.GOH OBJECT.GOH \
                OBJECTS/INPUTC.GOH OBJECTS/UIINPUTC.GOH OBJECTS/VISC.GOH
BMP.obj \
BMP.eobj: BMP/BMP.GOC GEOS.H  \
                 \
                 GSTRING.H GRAPHICS.H \
                FONTID.H FONT.H COLOR.H CHUNKARR.H OBJECT.H GEODE.H \
                LMEM.H OBJECTS/HELPCC.H FILE.H INPUT.H CHAR.H HWR.H WIN.H \
                VM.H TIMER.H EC.H HEAP.H ANSI/STRING.H HUGEARR.H
BMPROTATE.obj \
BMPROTATE.eobj: EXTGRAPH.GOH OBJECTS/WINC.GOH OBJECTS/METAC.GOH OBJECT.GOH \
                OBJECTS/INPUTC.GOH OBJECTS/UIINPUTC.GOH OBJECTS/VISC.GOH
BMPROTATE.obj \
BMPROTATE.eobj: BMP/BMPROTATE.GOC GEOS.H  \
                 \
                 GSTRING.H GRAPHICS.H \
                FONTID.H FONT.H COLOR.H CHUNKARR.H OBJECT.H GEODE.H \
                LMEM.H OBJECTS/HELPCC.H FILE.H INPUT.H CHAR.H HWR.H WIN.H \
                VM.H HUGEARR.H EC.H
EXTGR.obj \
EXTGR.eobj: EXTGRAPH.GOH OBJECTS/WINC.GOH OBJECTS/METAC.GOH OBJECT.GOH \
                OBJECTS/INPUTC.GOH OBJECTS/UIINPUTC.GOH OBJECTS/VISC.GOH
EXTGR.obj \
EXTGR.eobj: EXTGR/EXTGR.GOC GEOS.H  \
                 \
                 GSTRING.H GRAPHICS.H \
                FONTID.H FONT.H COLOR.H CHUNKARR.H OBJECT.H GEODE.H \
                LMEM.H OBJECTS/HELPCC.H FILE.H INPUT.H CHAR.H HWR.H WIN.H \
                VM.H TIMER.H EC.H
PAL.obj \
PAL.eobj: EXTGRAPH.GOH OBJECTS/WINC.GOH OBJECTS/METAC.GOH OBJECT.GOH \
                OBJECTS/INPUTC.GOH OBJECTS/UIINPUTC.GOH OBJECTS/VISC.GOH
PAL.obj \
PAL.eobj: PAL/PAL.GOC GEOS.H  \
                 \
                 HEAP.H GSTRING.H \
                GRAPHICS.H FONTID.H FONT.H COLOR.H ANSI/STRING.H LMEM.H \
                VM.H CHUNKARR.H OBJECT.H GEODE.H OBJECTS/HELPCC.H FILE.H \
                INPUT.H CHAR.H HWR.H WIN.H

extgraphEC.geo extgraph.geo : GEOS.LDF ANSIC.LDF 