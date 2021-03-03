VERSION_NAME=v3.0.3
# Set io's Version name in custom.js file
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  ~/WetAI_Terra_Docker/Code/Set_Interface.js

# Reference Code: https://github.com/braingeneers/WetAI_Docker/blob/main/Code/Set_Computer.sh


############################################
############################################
#.    Code From Original io
############################################
############################################

### Setup Jupyter config file
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  

### Generic Software Update
apt update
apt-get install update
conda update -y conda

### Install nb-extensiosn 
#conda install -y -c conda-forge  rise.  # not visible dunno why
jupyter nbextensions_configurator enable
jupyter nbextension enable collapsible_headings/main
#jupyter nbextension enable help_panel/help_panel. # not visible, dunno why
jupyter nbextension enable notify/notify
jupyter nbextension enable toc2/main
#jupyter nbextension enable varInspector/main # Cool but removes \tab autocomplete
jupyter nbextension enable codefolding/main
jupyter nbextension enable hide_header/main
jupyter nbextension enable hide_input_all/main
jupyter nbextension enable table_beautifier/main
jupyter nbextension enable codefolding/edit
jupyter nbextension enable contrib_nbextensions_help_item/main
jupyter nbextension enable python-markdown/main
jupyter nbextension enable move_selected_cells/main
jupyter nbextension enable splitcell/splitcell
jupyter nbextension enable tree-filter/index

# Install required python packages
pip3 install PyGithub
pip3 install timeago #pip install --upgrade google-cloud-datastore #pip install --upgrade firebase-admin
pip3 install redis

# Set Files from wet_io Github
# Set custom.js file for WetAI javscript code
sed -i '$d' ~/.jupyter/custom/custom.js
echo "  require(['custom/Set_Interface']);" >> ~/.jupyter/custom/custom.js
echo "});" >> ~/.jupyter/custom/custom.js
mv ~/WetAI_Terra_Docker/Code/Set_Interface.js ~/.jupyter/custom/
# Welcome to WetAI file
mv ~/WetAI_Docker/Welcome\ to\ WetAI.ipynb ~/

# Create user's starting Apps & Files by downloading everything from github



############################################
############################################
#.    Braingeneers
############################################
############################################

# Code used by all braingeneers
conda install -y -c plotly plotly-orca
apt-get install -y --no-install-recommends awscli # Install aws
pip install --upgrade git+https://github.com/braingeneers/braingeneerspy.git # install braingeneers python package
cd ~ && mkdir .aws # Setup for AWS credentials file
touch ~/.aws/credentials
pip install --upgrade nbstripout # used to clean up notebooks before committing them
apt install -y  zip unzip # allows zipping files

### Install Docker
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io
#dockerd & #commented because command doesn't work here
#service docker start # commented because command doesn't work



