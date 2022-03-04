#! /bin/sh

arr=('docker' 'entware')

for item in ${arr[*]}
do
  cd $GITHUB_WORKSPACE/wdpksrc/wdpk/$item
  ./build.sh
  cp $SRC_TAR $GITHUB_WORKSPACE/output/bin/$SRC_TAR
done
