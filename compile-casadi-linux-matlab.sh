# This build script compiles Ipopt and CasADi for Linux (64bit).
#
# Arguments:
#   - version string (Optional, defaults to current datetime)
#
# Many features of CasADi will not be included. Only the following packages
# and interfaces are included:
#   - Ipopt
#     - Metis
#     - Blas
#     - Lapack
#     - Mumps
#   - CasADi
#     - Matlab interface
#     - OpenMP
#     - Ipopt interface
#
# SWIG is used to create the Matlab interface but the library is not included
# in the final archive.
#
# The script remember when it completes step by dropping files in the build
# directory. You can enforce recompilation by removing the _COMPLETE files or
# deleting the whole build directory.
#
# The build directory will be created in the home directory with the name
# build-casadi-linux-matlab.
#
# Original source: https://github.com/OpenOCL/ocl-deployment/
# MIT License
#
# Author: Jonas Koenemann
set -e

if [ -z "$1" ]; then
  VERSION_STR=$(date +"%Y%m%d%H%M")
else
  VERSION_STR=$1
fi

if [ -z "${MATLAB_ROOT}" ]; then
   echo "You need to set MATLAB_ROOT environment variable to directory of your Matlab installation."
   exit 1
fi

if [ ! -e "$HOME/build-casadi-linux-matlab" ]; then
  mkdir $HOME/build-casadi-linux-matlab
fi

# copy patches to the build directory
cp dlopen.patch $HOME/build-casadi-linux-matlab

cd $HOME/build-casadi-linux-matlab


if [ ! -f "APT_COMPLETE" ]; then

  sudo apt-get update -qq
  sudo apt-get install p7zip-full -y
  sudo apt-get install bison -y
  sudo apt-get install -y binutils gcc g++ gfortran git cmake liblapack-dev ipython
  sudo apt-get install -y python-dev python-numpy python-scipy python-matplotlib libmumps-seq-dev
  sudo apt-get install -y libblas-dev liblapack-dev libxml2-dev
  sudo apt-get install -y fakeroot rpm alien
  sudo apt-get install -y libpcre3-dev automake yodl

  sudo apt-get install -y binutils gcc-4.8 g++-4.8 gfortran-4.8 git cmake liblapack-dev ipython python-dev python-numpy python-scipy python-matplotlib libmumps-seq-dev libblas-dev liblapack-dev libxml2-dev

  touch APT_COMPLETE

fi # APT_COMPLETE

if [ ! -f "IPOPT_COMPLETE" ]; then

  rm -rf $HOME/build-casadi-linux-matlab/ipopt-install
  rm -rf Ipopt-3.12.3
  rm -f Ipopt-3.12.3.tgz

  wget http://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.3.tgz
  tar -xf Ipopt-3.12.3.tgz
  cd Ipopt-3.12.3

  # patch -p1 < ../dlopen.patch

  cd ThirdParty

  cd Metis
  ./get.Metis
  cd ..

  cd Blas
  ./get.Blas
  cd ..

  cd Lapack
  ./get.Lapack
  cd ..

  cd Mumps
  ./get.Mumps
  cd ..

  cd ..
  mkdir build
  cd build
  mkdir $HOME/build-casadi-linux-matlab/ipopt-install
  ../configure coin_skip_warn_cxxflags=yes --prefix=$HOME/build-casadi-linux-matlab/ipopt-install \
      --disable-shared ADD_FFLAGS=-fPIC ADD_CFLAGS=-fPIC ADD_CXXFLAGS=-fPIC --with-blas=BUILD \
      --with-lapack=BUILD --with-mumps=BUILD --with-metis=BUILD --without-hsl --without-asl
  make -j4
  make install
  cd ..
  cd ..

  rm Ipopt-3.12.3.tgz
  touch IPOPT_COMPLETE

fi # IPOPT_COMPLETE

if [ ! -f "SWIG_COMPLETE" ]; then

  rm -rf $HOME/build-casadi-linux-matlab/swig-install
  rm -rf swig

  git clone --depth=1 https://github.com/jaeandersson/swig.git
  cd swig
  ./autogen.sh
  ./configure --prefix=$HOME/build-casadi-linux-matlab/swig-install
  make -j4
  make install
  cd ..

  touch SWIG_COMPLETE

fi # SWIG_COMPLETE

if [ ! -f "CASADI_COMPLETE" ]; then

  rm -rf $HOME/build-casadi-linux-matlab/casadi-install
  rm -rf casadi

  export SWIG_HOME="$HOME/build-casadi-linux-matlab/swig-install"
  export PATH="$SWIG_HOME/bin:$SWIG_HOME/share:$PATH"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/build-casadi-linux-matlab/ipopt-install/lib/pkgconfig"

  export CC=gcc-4.8
  export CXX=g++-4.8
  export FC=gfortran-4.8

  git clone https://github.com/casadi/casadi.git --depth=1
  cd casadi
  mkdir build
  mkdir -p build/swig/matlab/ && touch build/swig/matlab/SwigGet.m
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$HOME/build-casadi-linux-matlab/casadi-install -DWITH_OSQP=OFF \
      -DWITH_THREAD_MINGW=OFF -DWITH_THREAD=ON -DWITH_AMPL=OFF -DCMAKE_BUILD_TYPE=Release \
      -DWITH_SO_VERSION=OFF -DWITH_NO_QPOASES_BANNER=ON -DWITH_COMMON=ON -DWITH_HPMPC=OFF \
      -DWITH_BUILD_HPMPC=OFF -DWITH_BLASFEO=OFF -DWITH_BUILD_BLASFEO=OFF -DINSTALL_INTERNAL_HEADERS=ON \
      -DWITH_IPOPT=ON -DWITH_OPENMP=ON -DWITH_SELFCONTAINED=ON -DWITH_DEEPBIND=ON -DWITH_MATLAB=ON \
      -DWITH_DOC=OFF -DWITH_EXAMPLES=OFF -DWITH_EXTRA_WARNINGS=ON ..
  make -j4
  make install

  cd ..
  cd ..

  touch CASADI_COMPLETE

fi # CASADI_COMPLETE

rm -f casadi-3.4.5-linux-matlab-ipopt-minimal-${VERSION_STR}.zip
zip -r -q casadi-3.4.5-linux-matlab-ipopt-minimal-${VERSION_STR}.zip casadi-install

cd $HOME
cp $HOME/build-casadi-linux-matlab/casadi-3.4.5-linux-matlab-ipopt-minimal-${VERSION_STR}.zip .
