NW.obj \
NW.eobj: GEOS.DEF HEAP.DEF GEODE.DEF RESOURCE.DEF EC.DEF LMEM.DEF \
                SYSTEM.DEF LOCALIZE.DEF SLLANG.DEF DRIVE.DEF DISK.DEF \
                FILE.DEF DRIVER.DEF INITFILE.DEF THREAD.DEF TIMER.DEF \
                INTERNAL/FILEINT.DEF FILEENUM.DEF INTERNAL/DOS.DEF \
                INTERNAL/DRIVEINT.DEF INTERNAL/SEMINT.DEF \
                OBJECTS/PROCESSC.DEF OBJECTS/METAC.DEF OBJECT.DEF \
                CHUNKARR.DEF GEOWORKS.DEF INTERNAL/NETDR.DEF \
                INTERNAL/SERIALDR.DEF INTERNAL/STREAMDR.DEF \
                INTERNAL/SOCKETID.DEF INTERNAL/FSDRIVER.DEF \
                INTERNAL/FSD.DEF INTERNAL/DISKINT.DEF INTERNAL/MFSDR.DEF \
                INTERNAL/NETWARE.DEF INTERNAL/HEAPINT.DEF SYSSTATS.DEF \
                NET.DEF NETWARE.DEF NWMACROS.DEF NWCONSTANT.DEF \
                NWRESIDENT.ASM NWINIT.ASM NWUSERINFO.ASM \
                NWTEXTMESSAGE.ASM NWSIMPLESEM.ASM NWSEMHIGH.ASM \
                NWSEMLOW.ASM NWSEM.ASM NWSOCKET.ASM NWPRINT.ASM \
                NWSERVER.ASM INTERNAL/INTERRUP.DEF INTERNAL/GEODESTR.DEF \
                NWBINDERY.ASM NWUTILS.ASM NWDIR.ASM

NwEC.geo Nw.geo : GEOS.LDF NET.LDF 