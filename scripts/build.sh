#!/bin/bash

array=("docker" "entware")

for element in "${array[@]}"
do
    echo "$element"
    cd $GITHUB_WORKSPACE/wdpksrc
    pkg=$element
    echo ::set-output name=pkg::"$pkg"
    cd wdpk/${pkg}
    DATE="$(date +"%m%d%Y")"
    CWD="$(pwd)"
    VERSION="$(awk '/Version/{print $NF}' apkg.rc)"
    echo ::set-output name=version::"${VERSION}"
    NAME="$(awk '/AddonShowName/{print $NF}' apkg.rc)"
    echo ::set-output name=name::"${NAME}"
    DESCRIPTION="$(awk '/Description/{print $NF}' apkg.rc)"
    echo ::set-output name=description::"${DESCRIPTION}"
    echo "Building ${pkg} version ${VERSION}"
    echo "$(ls -l ../..)"
    RELEASE_DIR="../../packages/${pkg}/OS5"
    mkdir -p "${RELEASE_DIR}"
    echo "PLF ${PLATFORM} - $arr - ${PACKAGE}"
    echo "Build ${pkg} for $MODEL"
    ../../mksapkg-OS5 -E -s -m ${PLATFORM} > /dev/null
    mv ../${PLATFORM}*.bin\(* ../${pkg}_${VERSION}_${MODEL}.bin
    echo "$(ls -l ..)"
done
