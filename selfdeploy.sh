#!/bin/sh
git clone https://github.com/g2s3-2018/hippylib-hub.git
cd hippylib-hub
sudo docker build -t muq-hippylib/g2s3hub .
sudo docker run -td -p 80:8000 --name=g2s3hub muq-hippylib/g2s3hub
sleep 2m
sudo docker logs g2s3hub > g2s3hub.out
