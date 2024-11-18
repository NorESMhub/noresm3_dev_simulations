
# This file is auto-generated, do not edit. If you want to change
# sharedlib flags, you can edit the cmake_macros in this case. You
# can change flags for specific sharedlibs only by checking COMP_NAME.

CFLAGS :=  -qno-opt-dynamic-align -fp-model precise -std=gnu99 -O2 -debug minimal -no-fma -qopt-report -march=core-avx2
CPPDEFS := $(CPPDEFS)  -DCESMCOUPLED -DFORTRANUNDERSCORE -DCPRINTEL -DHAVE_GETTID
CXX_LDFLAGS :=  -cxxlib
CXX_LINKER := FORTRAN
FC_AUTO_R8 := -r8
FFLAGS :=  -qno-opt-dynamic-align  -convert big_endian -assume byterecl -ftz -traceback -assume realloc_lhs -fp-model source -O2 -debug minimal -no-fma -qopt-report -march=core-avx2
FFLAGS_NOOPT := -O0
FIXEDFLAGS := -fixed
FREEFLAGS := -free
MACRO_FILE := 
MPICC := mpicc
MPICXX := mpicpc
MPIFC := mpifort
NETCDF_C_PATH := /cluster/software/netCDF/4.9.0-iompi-2022a
NETCDF_FORTRAN_PATH := /cluster/software/netCDF-Fortran/4.6.0-iompi-2022a
PIO_FILESYSTEM_HINTS := lustre
PIO_INCDIR := /cluster/software/ParallelIO/2.5.10-iompi-2022a/include
PIO_LIBDIR := /cluster/software/ParallelIO/2.5.10-iompi-2022a/lib
PNETCDF_PATH := /cluster/software/PnetCDF/1.12.3-iompi-2022a
SCC := icc
SCXX := icpc
SFC := ifort
SLIBS := $(SLIBS)  -mkl=cluster
SUPPORTS_CXX := TRUE

ifeq "$(COMP_NAME)" "blom"
  FFLAGS :=  $(FC_AUTO_R8)  -qno-opt-dynamic-align  -convert big_endian -assume byterecl -ftz -traceback -assume realloc_lhs -fp-model source -O2 -debug minimal -no-fma -qopt-report -march=core-avx2
endif
