SOUNDMANAGER.obj \
SOUNDMANAGER.eobj: GEOS.DEF FILE.DEF GEODE.DEF HEAP.DEF RESOURCE.DEF EC.DEF \
                OBJECT.DEF LMEM.DEF INITFILE.DEF LIBRARY.DEF THREAD.DEF \
                SEM.DEF ASSERT.DEF DISK.DEF DRIVE.DEF SYSTEM.DEF \
                LOCALIZE.DEF SLLANG.DEF DRIVER.DEF INTERNAL/INTERRUP.DEF \
                INTERNAL/SEMINT.DEF INTERNAL/HEAPINT.DEF SYSSTATS.DEF \
                TIMER.DEF UI.DEF VM.DEF TEXT.DEF FONTID.DEF GRAPHICS.DEF \
                FONT.DEF COLOR.DEF CHAR.DEF WIN.DEF INPUT.DEF HWR.DEF \
                OBJECTS/PROCESSC.DEF OBJECTS/METAC.DEF CHUNKARR.DEF \
                GEOWORKS.DEF GCNLIST.DEF TIMEDATE.DEF \
                OBJECTS/TEXT/TCOMMON.DEF STYLESH.DEF IACP.DEF \
                OBJECTS/UIINPUTC.DEF OBJECTS/VISC.DEF OBJECTS/VCOMPC.DEF \
                OBJECTS/VCNTC.DEF INTERNAL/VUTILS.DEF OBJECTS/GENC.DEF \
                UDIALOG.DEF OBJECTS/GINTERC.DEF TOKEN.DEF \
                OBJECTS/CLIPBRD.DEF OBJECTS/GSYSC.DEF OBJECTS/GPROCC.DEF \
                ALB.DEF OBJECTS/GFIELDC.DEF OBJECTS/GSCREENC.DEF \
                OBJECTS/GFSELC.DEF OBJECTS/GVIEWC.DEF OBJECTS/GCONTC.DEF \
                OBJECTS/GCTRLC.DEF OBJECTS/GDOCC.DEF OBJECTS/GDOCCTRL.DEF \
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
                OBJECTS/EMOMC.DEF OBJECTS/EMTRIGC.DEF INTERNAL/UPROCC.DEF \
                INTERNAL/SOUNDDRV.DEF INTERNAL/STRDRINT.DEF \
                INTERNAL/STREAMDR.DEF SOUND.DEF INTERNAL/SOUNDFMT.DEF \
                SOUNDCONSTANT.DEF SOUNDERROR.DEF SOUNDCOMMON.ASM \
                PRODUCT.DEF SOUNDRESIDENT.ASM SOUNDVOICEALLOCATION.ASM \
                SOUNDC.ASM SOUNDDRIVER.ASM SOUNDMIXER.ASM

SoundEC.geo Sound.geo : geos.ldf stream.ldf
