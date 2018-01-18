FROM quay.io/fenicsproject/stable:2017.2.0.r3
MAINTAINER Jack S. Hale

USER root

RUN apt-get update && \ 
    apt-get install -yy pwgen npm nodejs-legacy python3-pip && \
    npm install -g configurable-http-proxy && \
    pip3 install jupyterhub==0.4.1 && \
    pip3 install ipython[notebook]==4.0.0 

#RUN apt-get update && \
#    apt-get install -yy pwgen npm nodejs-legacy python3-pip && \
#    npm install -g configurable-http-proxy && \
#    pip3 install jupyterhub==0.4.1 ipython[notebook]==4.0.0 && \
#    pip2 install --upgrade ipython[notebook]==4.0.0 && \
#    pip2 install --upgrade matplotlib==1.5.1

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN mkdir /etc/certs
#RUN touch /etc/certs/ssl.key
#RUN touch /etc/certs/ssl.crt
#RUN openssl req -x509 -nodes -days 730 -newkey rsa:2048 \ 
#                 -subj "/C=XY/ST=XYZ/L=XYZ/O=XYZ/CN=example.com" \ 
#                 -keyout /etc/certs/ssl.key -out /etc/certs/ssl.crt

RUN mkdir -p /usr/local/share/jupyter/kernels/python2
COPY kernel.json /usr/local/share/jupyter/kernels/python2/kernel.json
COPY jupyterhub_config.py /home/fenics/jupyterhub_config.py
COPY make-users.sh /etc/my_init.d/make-users.sh
RUN chmod +x /etc/my_init.d/make-users.sh
RUN mkdir -p /home/fenics/.jupyter
COPY jupyter_notebook_config.py /home/fenics/.jupyter/jupyter_notebook_config.py

USER fenics
COPY hippylib /home/fenics/hippylib
#COPY hippylib-tutorial /home/fenics/hippylib-tutorial

USER root
ENV NUMBER_OF_USERS 120
WORKDIR /home/fenics/
ENTRYPOINT ["/sbin/my_init","--"]
CMD ["jupyterhub"]
