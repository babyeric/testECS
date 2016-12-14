#!/bin/bash
set -e
MY_ECR="image_xyz"
MY_VER=$(date +%s)

echo MY_VER="$MY_VER"

echo build...
zip -r ./build/image/web.zip ./web

echo create docker image...
cd ./build/image && docker build -t "$MY_ECR":"$MY_VER" .
docker tag "$MY_ECR":"$MY_VER" 366301983362.dkr.ecr.us-west-2.amazonaws.com/test_repo:"$MY_VER"
docker push 366301983362.dkr.ecr.us-west-2.amazonaws.com/test_repo:"$MY_VER"
