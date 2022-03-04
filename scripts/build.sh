#!/bin/bash

array=("docker" "entware")

for element in "${array[@]}"
do
    echo "$element"
    cd $GITHUB_WORKSPACE/wdpksrc/wdpk/$element
    ./build.sh
    cp $SRC_TAR $GITHUB_WORKSPACE/output/bin/$SRC_TAR
done
