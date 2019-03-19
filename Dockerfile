FROM quay.io/fenicsproject/stable:2017.2.0
MAINTAINER U. Villa

USER root

RUN apt-get update && \
    apt-get install -yy pwgen npm nodejs-legacy python3-pip && \
    npm install -g configurable-http-proxy@3.1.1 && \
    pip3 install jupyterhub==0.8.1 ipython[notebook]==6.2.1 h5py pandas

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



USER fenics

# Install hIPPYlib
RUN cd /home/fenics/ && \
    git clone https://github.com/hippylib/hippylib.git && \
    cd hippylib && git checkout -b tags/2.2.0 && cd .. &&\
    chmod -R o+rx hippylib

# Copy the notebooks
RUN cd /home/fenics/ && \
    git clone https://github.com/uvilla/cmis_labs.git

COPY jupyterhub_config.py /home/fenics/jupyterhub_config.py
COPY python3_config.json /usr/local/share/jupyter/kernels/python3/kernel.json
COPY make-users.py /home/fenics/make-users.py
COPY update_lab.py /home/fenics/update_lab.py
COPY users.csv /home/fenics/users.csv
RUN mkdir -p /home/fenics/.jupyter
COPY jupyter_notebook_config.py /home/fenics/.jupyter/jupyter_notebook_config.py
ENV PYTHONPATH /home/fenics/hippylib

USER root

RUN python make-users.py

WORKDIR /home/fenics/
ENTRYPOINT ["/sbin/my_init","--"]
CMD ["jupyterhub"]
