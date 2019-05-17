# this one is important
SET(CMAKE_SYSTEM_NAME Windows)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)
# specify the cross compiler
set(COMPILER_PREFIX "x86_64-w64-mingw32")
SET(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++)
SET(CMAKE_Fortran_COMPILER x86_64-w64-mingw32-gfortran)
set(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)
set(CMAKE_RANLIB x86_64-w64-mingw32-ranlib)
set(CMAKE_AR x86_64-w64-mingw32-ar)
# where is the target environment
SET(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)
