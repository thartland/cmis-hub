git clone https://bitbucket.org/hippylibdev/hippylib-hub.git
cd hippylib-hub
git clone https://github.com/hippylib/hippylib.git
sudo docker build -t hippylib/hub .
sudo docker run -td -p 80:8000 --name=hippyhub hippylib/hub
sudo docker logs hippyhub >& hippyhub.out