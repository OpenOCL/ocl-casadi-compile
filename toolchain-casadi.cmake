SET(CMAKE_SYSTEM_NAME Windows)
SET(CMAKE_SYSTEM_VERSION 1)
SET(PREFIX x86_64-w64-mingw32)
SET(CMAKE_C_COMPILER x86_64-w64-mingw32-gcc-posix)
SET(CMAKE_CXX_COMPILER x86_64-w64-mingw32-g++-posix)
SET(CMAKE_Fortran_COMPILER x86_64-w64-mingw32-gfortran-posix)
SET(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres)
SET(CMAKE_FIND_ROOT_PATH /usr/x86_64-w64-mingw32)
SET(CMAKE_SHARED_LIBRARY_SUFFIX "dll")
SET(CMAKE_CXX_FLAGS " -fno-ipa-cp-clone" CACHE STRING "" FORCE)
SET(CMAKE_C_FLAGS " -fno-ipa-cp-clone" CACHE STRING "" FORCE)