
FROM us.gcr.io/broad-dsp-gcr-public/terra-jupyter-python:1.0.4
USER root
#ENV PIP_USER=false
WORKDIR /home/jupyter

#############################################################
#############################################################
#.                        My Code
#############################################################
#############################################################

# David's Code 
ENV ENDPOINT_URL="https://s3.nautilus.optiputer.net"
ENV S3_ENDPOINT="s3.nautilus.optiputer.net"
ENV AWS_LOG_LEVEL=3
ENV TF_CPP_MIN_LOG_LEVEL=3

# Set Terra WetAI environment
#RUN cd / && mkdir temp
RUN cd /home && git clone https://github.com/braingeneers/WetAI_Terra_Docker.git
RUN cd /home && git clone https://github.com/braingeneers/WetAI_Docker.git         # Download original WetAI docker because we use some of the files
RUN cd /hom && ls

RUN cd /home/WetAI_Terra_Docker/Code && chmod +x Set_Computer.sh && ./Set_Computer.sh
#RUN cd WetAI_Terra_Docker/Code && chmod +x Set_Computer.sh && ./Set_Computer.sh
#RUN echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  

# Copied from Base image
USER jupyter
#ENV USER jupyter
#USER $USER
#ENV PIP_USER=true
#ENV TF_ENABLE_ONEDNN_OPTS=1

ENTRYPOINT ["/opt/conda/bin/jupyter", "notebook"]
