# Jupyterhub and FEniCS Educational Environment
## Jack S. Hale

This will launch a full multi-user FEniCS Project environment for classrooms,
courses and general fun using Jupyterhub, iPython Notebook and FEniCS. Each
user has his own home directory.

1. Install Docker from http://docker.com
2. Launch the container:

        docker run -ti -p 80:8000 jhale/fenics-jupyter
   
    This will print a list of usernames and passwords to hand out to your users.
    The administrator user has username fenics and password docker. You can (and
    should) change this the usual way at the terminal in jupyter. 

        passwd

    If you need more users start the container with:

        docker run -ti -p 80:8000 --env NUMBER_OF_USERS=30 jhale/fenics-jupyter

3. Get your users to connect to ipython in your web browser with the address:

        http://<your ip here>

4. Login and start a Python 2 notebook. You can enable inline plotting in a notebook using:

        %matplotlib inline
        %run /home/fenics/fenics-matplotlib.py 

5. Get up and running with DOLFIN:

        from dolfin import *

Coming at a later date:

* SSL support.
* Amazon AWS instructions. In short: yes, you can run this image on AWS instances.
