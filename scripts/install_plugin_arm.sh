#!/bin/sh -e

# Copied w/ love from the excellent hypnoglow/helm-s3

if [ -n "${HELM_PUSH_PLUGIN_NO_INSTALL_HOOK}" ]; then
    echo "Development mode: not downloading versioned release."
    exit 0
fi

version="$(cat plugin.yaml | grep "version" | cut -d '"' -f 2)"
echo "Coping and installing helm-push v${version} ..."
#
#helm-push_0.9.0_linux_arm64.tar.gz
mkdir -p "bin"
mkdir -p "releases/v${version}/bin"
cp ./bin/linux/arm64/helmpush releases/v${version}/bin/
cp ./LICENSE releases/v${version}/
cp ./plugin.yaml releases/v${version}/

mv "releases/v${version}/bin/helmpush" "bin/helmpush"

