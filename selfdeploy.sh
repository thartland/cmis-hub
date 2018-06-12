#!/bin/sh
git clone https://github.com/hippylib/hippylib-hub.git
cd hippylib-hub
sudo docker pull mparno/muq-hippylib
sudo docker run -td -p 80:8000 --name=hippyhub mparno/muq-hippylib
sudo docker logs hippyhub > hippyhub.out
