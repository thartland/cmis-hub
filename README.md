# Jupyterhub and hIPPYlib Educational Environment
## Umberto Villa

This will launch a full multi-user FEniCS Project environment for classrooms,
courses and general fun using Jupyterhub, iPython Notebook and FEniCS. Each
user has his own home directory.

This scripts are an adaptation of Jake Hale's project available from [fenics-jupyter](https://bitbucket.org/jackhale/fenics-jupyter).

Here a list of instruction:

1. (One time only) Install [docker](https://www.docker.com/). On Ubuntu one can simply enter the command
```
#!sh
    apt-get install docker.io
```

2. (One time only) Clone the hippylib-hub repository
```
#!sh
    git clone https://npetra@bitbucket.org/npetra/hippylib-hub.git
```

3. (One time only) Go inside the `hippylib-hub` folder, and clone `hippylib` and `hippylib-tutorial`:
```
#!sh
    cd hippylib-hub
    git clone https://npetra@bitbucket.org/npetra/hippylib.git
    git clone https://npetra@bitbucket.org/npetra/hippylib-tutorial.git
```
4. Build the docker image (This step needs to be repeated each time `hippylib` or `hippylib-tutorial` is updated)
```
#!sh
    ./build_hippyhub.sh
```

5. Check that the image was created correctly with the command
```
#!sh
    docker images
```

6. Start the server
```
#!sh
    ./run_hippyhub.sh
```

7. Check that the server is up
```
#!sh
    docker ps
```

8. Stop ad delete the server (always stop the server before rebuilding the docker image)
```
#!sh
    ./stop_hippyhub
```