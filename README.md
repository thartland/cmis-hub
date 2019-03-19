# MUQ-hIPPYlib Educational Environment
## Umberto Villa

This will launch a multi-user MUQ-hIPPYlib environment for classrooms,
courses and general fun using Jupyterhub and Jupyter Notebook.
Each user has his own home directory.

This scripts are an adaptation of Jake Hale's project available from [fenics-jupyter](https://bitbucket.org/jackhale/fenics-jupyter).

Here a list of instructions:

1. (One time only) Install [docker](https://www.docker.com/). On Ubuntu one can simply enter the command

    ```
    apt-get install docker.io
    ```
    
2. Build the docker image

    ```
    sudo docker build -t hippyhub/cmis .
    ```
   
3. Check that the image was created correctly with the command

    ```
    sudo docker images
    ```
   
4. Start the server

    ```
    sudo docker run -td -p 80:8000 --name=cmis-hub hippyhub/cmis 
    ```
   
5. Check that the server is up

    ```
    sudo docker ps
    ```
   
6. Check messages from the server

    ```
    sudo docker logs cmis-hub
    ```

7. Connect to server
   ```    
   docker exec -it cmis-hub /bin/bash
   ```
   
8. Stop ad delete the server (always stop the server before rebuilding the docker image)

    ```
    sudo docker stop cmis-hub & sudo docker rm cmis-hub
    ```
