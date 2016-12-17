#!/bin/bash
set -e
MY_ECR="image_xyz"
MY_VER=$(date +%s)

echo MY_VER="$MY_VER"
sed -i "s/\$BUILD_VER/$MY_VER/g" ./build/taskDef.txt

echo build...
zip -r ./build/image/web.zip ./web

echo create docker image...
cd ./build/image && docker build -t "$MY_ECR":"$MY_VER" .

CMD_DOCKER_LOGIN=`aws ecr get-login --region us-west-2`
echo docker login...
$CMD_DOCKER_LOGIN

echo tag image on ECR...
docker tag "$MY_ECR":"$MY_VER" 366301983362.dkr.ecr.us-west-2.amazonaws.com/test_repo:"$MY_VER"

echo push image to ECR...
docker push 366301983362.dkr.ecr.us-west-2.amazonaws.com/test_repo:"$MY_VER"
