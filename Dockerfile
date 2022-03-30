
FROM us.gcr.io/broad-dsp-gcr-public/terra-jupyter-python:1.0.4
USER root
ENV PIP_USER=false
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
WORKDIR /home/jupyter
RUN cd ~ && git clone https://github.com/braingeneers/WetAI_Terra_Docker.git
RUN cd ~ && git clone https://github.com/braingeneers/WetAI_Docker.git         # Download original WetAI docker because we use some of the files

#RUN cd ~/WetAI_Terra_Docker/Code && chmod +x Set_Computer.sh && ./Set_Computer.sh
#RUN echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  

# Copied from Base image
ENV USER jupyter
USER $USER
# We want pip to install into the user's dir when the notebook is running.
ENV PIP_USER=true
# Enable Intel oneDNN optimizatoin by default
ENV TF_ENABLE_ONEDNN_OPTS=1

#EXPOSE 80
#EXPOSE 8888
#CMD ["jupyter","notebook"]
ENTRYPOINT ["/usr/local/bin/jupyter", "notebook"]
#ENTRYPOINT ["/opt/conda/bin/jupyter", "notebook"] #, "--allow-root"]
