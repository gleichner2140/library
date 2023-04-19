#!/usr/bin/env bash

set -e

version=${1:?}

cache_dir="$(pwd)/.cache/docker-compose-download"
rm    -rf "${cache_dir}"
mkdir -p  "${cache_dir}"
version_folder="${cache_dir}/${version}"
mkdir -p "${version_folder}"
curl -SL "https://github.com/docker/compose/releases/download/${version}/docker-compose-linux-x86_64"   -o "${version_folder}/docker-compose-linux-x86_64"
curl -SL "https://github.com/docker/compose/releases/download/${version}/docker-compose-linux-aarch64"  -o "${version_folder}/docker-compose-linux-aarch64"
bvfs commit --remote /library/docker-compose --local "${cache_dir}"
rm -rf "${cache_dir}"
