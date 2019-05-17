set -e

rm -rf $HOME/casadi-install
mkdir $HOME/casadi-install
cp testCasadiIpopt.m $HOME/casadi-install
OCL_VERSION="201905161300"
cd $HOME
unzip -q $HOME/casadi-3.4.5-linux-matlab-ipopt-minimal-$OCL_VERSION.zip

cd $HOME/casadi-install
sh $HOME/matlab-linux-2014b/bin/matlab -nodisplay -r "addpath('casadi'); testCasadiIpopt; quit"
