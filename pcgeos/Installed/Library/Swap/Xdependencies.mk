SWAP.obj \
SWAP.eobj: GEOS.DEF HEAP.DEF GEODE.DEF RESOURCE.DEF EC.DEF \
                LIBRARY.DEF SYSTEM.DEF LOCALIZE.DEF SLLANG.DEF \
                INTERNAL/SWAP.DEF INTERNAL/FILEINT.DEF FILE.DEF \
                FILEENUM.DEF INTERNAL/DOS.DEF INTERNAL/DRIVEINT.DEF \
                DRIVE.DEF INTERNAL/SEMINT.DEF LMEM.DEF SYSSTATS.DEF \
                INTERNAL/HEAPINT.DEF

SwapEC.geo Swap.geo : geos.ldf 
