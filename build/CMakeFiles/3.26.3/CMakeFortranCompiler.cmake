set(CMAKE_Fortran_COMPILER "/glade/u/apps/derecho/23.09/spack/opt/spack/ncarcompilers/1.0.0/gcc/12.2.0/zue2/bin/ftn")
set(CMAKE_Fortran_COMPILER_ARG1 "")
set(CMAKE_Fortran_COMPILER_ID "GNU")
set(CMAKE_Fortran_COMPILER_VERSION "12.2.0")
set(CMAKE_Fortran_COMPILER_WRAPPER "CrayPrgEnv")
set(CMAKE_Fortran_PLATFORM_ID "")
set(CMAKE_Fortran_SIMULATE_ID "")
set(CMAKE_Fortran_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_Fortran_SIMULATE_VERSION "")




set(CMAKE_AR "/usr/bin/ar")
set(CMAKE_Fortran_COMPILER_AR "/opt/cray/pe/gcc/12.2.0/snos/bin/gcc-ar")
set(CMAKE_RANLIB "/usr/bin/ranlib")
set(CMAKE_Fortran_COMPILER_RANLIB "/opt/cray/pe/gcc/12.2.0/snos/bin/gcc-ranlib")
set(CMAKE_COMPILER_IS_GNUG77 1)
set(CMAKE_Fortran_COMPILER_LOADED 1)
set(CMAKE_Fortran_COMPILER_WORKS TRUE)
set(CMAKE_Fortran_ABI_COMPILED TRUE)

set(CMAKE_Fortran_COMPILER_ENV_VAR "FC")

set(CMAKE_Fortran_COMPILER_SUPPORTS_F90 1)

set(CMAKE_Fortran_COMPILER_ID_RUN 1)
set(CMAKE_Fortran_SOURCE_FILE_EXTENSIONS f;F;fpp;FPP;f77;F77;f90;F90;for;For;FOR;f95;F95)
set(CMAKE_Fortran_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_Fortran_LINKER_PREFERENCE 20)
if(UNIX)
  set(CMAKE_Fortran_OUTPUT_EXTENSION .o)
else()
  set(CMAKE_Fortran_OUTPUT_EXTENSION .obj)
endif()

# Save compiler ABI information.
set(CMAKE_Fortran_SIZEOF_DATA_PTR "8")
set(CMAKE_Fortran_COMPILER_ABI "")
set(CMAKE_Fortran_LIBRARY_ARCHITECTURE "")

if(CMAKE_Fortran_SIZEOF_DATA_PTR AND NOT CMAKE_SIZEOF_VOID_P)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_Fortran_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_Fortran_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_Fortran_COMPILER_ABI}")
endif()

if(CMAKE_Fortran_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()





set(CMAKE_Fortran_IMPLICIT_INCLUDE_DIRECTORIES "/glade/u/apps/derecho/23.09/spack/opt/spack/netcdf/4.9.2/gcc/12.2.0/gjc6/include;/glade/u/apps/derecho/23.09/spack/opt/spack/hdf5/1.12.2/gcc/12.2.0/cqpo/include;/glade/u/apps/derecho/23.09/opt/view/include;/opt/cray/pe/mpich/8.1.27/ofi/gnu/9.1/include;/opt/cray/pe/pmi/6.1.12/include;/opt/cray/pe/pals/1.2.12/include;/opt/cray/pe/gcc/12.2.0/snos/lib/gcc/x86_64-suse-linux/12.2.0/finclude;/opt/cray/pe/gcc/12.2.0/snos/lib/gcc/x86_64-suse-linux/12.2.0/include;/usr/local/include;/opt/cray/pe/gcc/12.2.0/snos/include;/opt/cray/pe/gcc/12.2.0/snos/lib/gcc/x86_64-suse-linux/12.2.0/include-fixed;/usr/include")
set(CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES "pmi;pmi2;pthread;pals;mpifort_gnu_91;mpi_gnu_91;rt;pthread;pmi;pmi2;gfortran;quadmath;pthread;gfortran;m;gcc_s;gcc;quadmath;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_Fortran_IMPLICIT_LINK_DIRECTORIES "/glade/u/apps/derecho/23.09/spack/opt/spack/netcdf/4.9.2/gcc/12.2.0/gjc6/lib;/glade/u/apps/derecho/23.09/spack/opt/spack/hdf5/1.12.2/gcc/12.2.0/cqpo/lib;/glade/u/apps/derecho/23.09/opt/view/lib64;/glade/u/apps/derecho/23.09/opt/view/lib;/opt/cray/pe/mpich/8.1.27/ofi/gnu/9.1/lib;/opt/cray/pe/pmi/6.1.12/lib;/opt/cray/pe/pals/1.2.12/lib;/opt/cray/pe/gcc/12.2.0/snos/lib/gcc/x86_64-suse-linux/12.2.0;/opt/cray/pe/gcc/12.2.0/snos/lib64;/lib64;/usr/lib64;/opt/cray/pe/gcc/12.2.0/snos/lib")
set(CMAKE_Fortran_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
