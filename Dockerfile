FROM quay.io/fenicsproject/stable:2017.2.0.r3
MAINTAINER U. Villa

USER root

RUN apt-get update && \
    apt-get install -yy pwgen npm nodejs-legacy python3-pip && \
    npm install -g configurable-http-proxy && \
    pip3 install jupyterhub==0.8.1 && \
    pip3 install ipython[notebook]==6.2.1 && \
    pip install jupyterlab

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN mkdir /etc/certs
#RUN touch /etc/certs/ssl.key
#RUN touch /etc/certs/ssl.crt
#RUN openssl req -x509 -nodes -days 730 -newkey rsa:2048 \
#                 -subj "/C=XY/ST=XYZ/L=XYZ/O=XYZ/CN=example.com" \
#                 -keyout /etc/certs/ssl.key -out /etc/certs/ssl.crt

COPY jupyterhub_config.py /home/fenics/jupyterhub_config.py
COPY make-users.sh /etc/my_init.d/make-users.sh
RUN chmod +x /etc/my_init.d/make-users.sh
RUN mkdir -p /home/fenics/.jupyter
COPY jupyter_notebook_config.py /home/fenics/.jupyter/jupyter_notebook_config.py

USER fenics
#COPY hippylib /home/fenics/hippylib
#COPY hippylib-tutorial /home/fenics/hippylib-tutorial

# Install MUQ
RUN cd /home/fenics && \
    mkdir Installations; mkdir Installations/MUQ_INSTALL && \
    git clone --depth 1 https://mparno@bitbucket.org/mparno/muq2.git && \
    cd muq2/; mkdir build; cd build;  \
    cmake -DCMAKE_INSTALL_PREFIX=/home/fenics/Installations/MUQ_INSTALL -DMUQ_USE_PYTHON=ON ../ && \
    make install

COPY python3_config.json /usr/local/share/jupyter/kernels/python3/kernel.json
ENV LD_LIBRARY_PATH /home/fenics/Installations/MUQ_INSTALL/lib:/home/fenics/Installations/MUQ_INSTALL/muq_external/lib
ENV PYTHONPATH /home/fenics/Installations/MUQ_INSTALL/lib

USER root
ENV NUMBER_OF_USERS 10
WORKDIR /home/fenics/
ENTRYPOINT ["/sbin/my_init","--"]
CMD ["jupyterhub"]
