#!/usr/bin/env bash

set -e

version=${1:?}

cache_dir="$(pwd)/.cache/doraemon-download"
rm    -rf "${cache_dir}"
mkdir -p  "${cache_dir}"
version_folder="${cache_dir}/${version}"
mkdir -p "${version_folder}"
curl -L "https://github.com/ismdeep/doraemon/releases/download/${version}/doraemon-linux-x86_64"   -o "${version_folder}/doraemon-linux-x86_64"
curl -L "https://github.com/ismdeep/doraemon/releases/download/${version}/doraemon-linux-aarch64"  -o "${version_folder}/doraemon-linux-aarch64"
bvfs commit --remote /library/doraemon --local "${cache_dir}"
rm -rf "${cache_dir}"
