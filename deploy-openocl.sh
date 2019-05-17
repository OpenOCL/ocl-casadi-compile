# the paths to matlab are tailored to my personal machine
OCL_VERSION=4.23

# compile casadi for linux
rm -f $HOME/casadi-3.4.5-linux-matlab-ipopt-minimal-${OCL_VERSION}.zip
export MATLAB_ROOT=$HOME/matlab-linux-2014b
sh compile-casadi-linux-matlab.sh ${OCL_VERSION}

# compile casadi for windows
rm -f $HOME/casadi-3.4.5-win-matlab-ipopt-minimal-${OCL_VERSION}.zip
export MATLAB_ROOT=$HOME/matlab-install-R2016a
sh compile-casadi-win-matlab.sh ${OCL_VERSION}

datestr=$(date +"%Y%m%d%H%M")
mkdir $HOME/openocl-deploy-$datestr
cp README $HOME/openocl-deploy-$datestr
cd $HOME/openocl-deploy-$datestr

# get source codes
git clone https://github.com/OpenOCL/OpenOCL.git openocl_repo
cd openocl_repo
git checkout-index -a -f --prefix=../openocl/
cd ..
rm -rf openocl_repo
rm openocl/.gitignore
rm openocl/README.md

mkdir casadi
cd casadi
wget https://github.com/casadi/casadi/archive/master.zip -O casadi_master.zip
cd ..

mkdir ipopt
cd ipopt
wget http://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.3.tgz
cd ..

mkdir blas
cd blas
wget http://www.netlib.org/blas/blas.tgz
cd ..

mkdir lapack
cd lapack
wget http://www.netlib.org/lapack/lapack-3.4.2.tgz
cd ..

mkdir mumps
cd mumps
wget http://mumps.enseeiht.fr/MUMPS_4.10.0.tar.gz
cd ..

mkdir metis
cd metis
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.3.tar.gz
cd ..

mkdir openocl/ThirdParty
mv casadi openocl/ThirdParty/casadi
mv ipopt openocl/ThirdParty/ipopt
mv blas openocl/ThirdParty/blas
mv lapack openocl/ThirdParty/lapack
mv mumps openocl/ThirdParty/mumps
mv metis openocl/ThirdParty/metis

# Linux
rm -f openocl-${OCL_VERSION}-linux.zip
unzip -q $HOME/casadi-3.4.5-linux-matlab-ipopt-minimal-${OCL_VERSION}.zip
mkdir openocl/Lib
cp -r casadi-install/casadi/* openocl/Lib
rm -rf casadi-install

cp README openocl
cd openocl
zip -r -q ../OpenOCL-${OCL_VERSION}-linux.zip .
cd ..
rm -rf openocl/Lib

# Windows
rm -f openocl-${OCL_VERSION}-win.zip
unzip -q $HOME/casadi-3.4.5-win-matlab-ipopt-minimal-${OCL_VERSION}.zip
mkdir openocl/Lib
cp -r casadi-install/casadi/* openocl/Lib
rm -rf casadi-install

cp README openocl
cd openocl
zip -r -q ../OpenOCL-${OCL_VERSION}-win.zip .
cd ..
rm -rf openocl/Lib
