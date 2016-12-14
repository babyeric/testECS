#!/bin/bash
set -e
MY_ECR="image_xyz"
MY_VER=$(date +%s)

echo MY_VER="$MY_VER"

echo build...
zip -r ./build/image/web.zip ./web

echo create docker image...
cd ./build/image && docker build -t "$MY_ECR":"$MY_VER" .