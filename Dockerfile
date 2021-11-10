
#FROM jupyter/tensorflow-notebook:latest
FROM us.gcr.io/broad-dsp-gcr-public/terra-jupyter-python:1.0.1
# Old Version: us.gcr.io/broad-dsp-gcr-public/terra-jupyter-python:0.0.23

# Last Used image: jupyter/tensorflow-notebook:feacdbfc2e89

USER root
#WORKDIR /home/jovyan



#############################################################
#############################################################
#.              Code From Jupyter Dockerfiles
#############################################################
#############################################################

###########################
#.  Jupyter base-notebook
###########################

#!!! Dockerfile reference: https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile

#!!! Goal: Install Conda
#!!! Note: Terra said they installed Conda, but they didn't: https://github.com/DataBiosphere/terra-docker/tree/master/terra-jupyter-base

#ARG NB_USER="jupyter-user"
#ENV UID="1000"

# ---- Miniforge installer ----
# Default values can be overridden at build time
# (ARGS are in lower case to distinguish them from ENV)
# Check https://github.com/conda-forge/miniforge/releases
# Conda version
#ARG conda_version="4.9.2"
# Miniforge installer patch version
#ARG miniforge_patch_number="7"
# Miniforge installer architecture
#ARG miniforge_arch="x86_64"
# Package Manager and Python implementation to use (https://github.com/conda-forge/miniforge)
# - conda only: either Miniforge3 to use Python or Miniforge-pypy3 to use PyPy
# - conda + mamba: either Mambaforge to use Python or Mambaforge-pypy3 to use PyPy
#ARG miniforge_python="Mambaforge"

# Miniforge archive to install
#ARG miniforge_version="${conda_version}-${miniforge_patch_number}"
# Miniforge installer
#ARG miniforge_installer="${miniforge_python}-${miniforge_version}-Linux-${miniforge_arch}.sh"
# Miniforge checksum
#ARG miniforge_checksum="5a827a62d98ba2217796a9dc7673380257ed7c161017565fba8ce785fb21a599"

#ENV CONDA_DIR=/opt/conda
#ENV CONDA_VERSION="${conda_version}"
#ENV PATH=$CONDA_DIR/bin:$PATH 

# Install conda as jovyan and check the sha256 sum provided on the download site
#WORKDIR /tmp

#RUN wget --quiet "https://github.com/conda-forge/miniforge/releases/download/${miniforge_version}/${miniforge_installer}" && \
#    echo "${miniforge_checksum} *${miniforge_installer}" | sha256sum --check && \
#    /bin/bash "${miniforge_installer}" -f -b -p $CONDA_DIR && \
#    rm "${miniforge_installer}" && \
#    conda list python | grep '^python ' | tr -s ' ' | cut -d '.' -f 1,2 | sed 's/$/.*/' >> $CONDA_DIR/conda-meta/pinned && \
#    conda update --all --quiet --yes 



#############################################################
#############################################################
#.                        My Code
#############################################################
#############################################################




# David's Code (Check if necessary)
ENV ENDPOINT_URL="https://s3.nautilus.optiputer.net"
ENV S3_ENDPOINT="s3.nautilus.optiputer.net"
ENV AWS_LOG_LEVEL=3
ENV TF_CPP_MIN_LOG_LEVEL=3

# Set Terra WetAI environment
WORKDIR /home/jupyter
RUN git clone https://github.com/braingeneers/WetAI_Terra_Docker.git
RUN git clone https://github.com/braingeneers/WetAI_Docker.git         # Download original WetAI docker because we use some of the files

RUN cd /home/jupyter/WetAI_Terra_Docker/Code && chmod +x Set_Computer.sh && ./Set_Computer.sh



#EXPOSE 80
#EXPOSE 8888
#CMD ["jupyter","notebook"]
#ENTRYPOINT ["/usr/local/bin/jupyter", "notebook"]
ENTRYPOINT ["/opt/conda/bin/jupyter", "notebook"]
