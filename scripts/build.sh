#!/bin/bash

array=("docker" "entware")

for element in "${array[@]}"
do
    echo "$element"
    cd $GITHUB_WORKSPACE/wdpksrc/wdpk/$element
    ./build.sh
    cp -f $(find ./ -type f -name "*.bin") $GITHUB_WORKSPACE/output/bin/
    cp -f $(find ./ -type f -name "*.tar.gz") $GITHUB_WORKSPACE/output/bin/
done
