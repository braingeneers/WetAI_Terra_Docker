VERSION_NAME=v4.0.0
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
apt update; apt-get install update; conda update -y conda

### Install nb-extensiosn 
conda install -y -c conda-forge  rise  # not visible dunno why
conda install -y -c conda-forge jupyter_contrib_nbextensions
conda install -y jupyterlab
jupyter nbextensions_configurator enable
for package in collapsible_headings/main notify/notify toc2/main codefolding/main hide_header/main hide_input_all/main table_beautifier/main codefolding/edit contrib_nbextensions_help_item/main python-markdown/main move_selected_cells/main help_panel/help_panel splitcell/splitcell tree-filter/index; do jupyter nbextension enable $package; done;
#jupyter nbextension enable varInspector/main # Cool but removes \tab autocomplete

# Set Files from wet_io Github
# Set custom.js file for WetAI javscript code
sed -i '$d' ~/.jupyter/custom/custom.js
echo "  require(['custom/Set_Interface']);" >> ~/.jupyter/custom/custom.js
echo "});" >> ~/.jupyter/custom/custom.js
mv ~/WetAI_Terra_Docker/Code/Set_Interface.js ~/.jupyter/custom/
# create notebooks folder for data and put fiels there
# Welcome to WetAI file
# Create user's starting Apps & Files by downloading everything from github
mkdir ~/notebooks
mv ~/WetAI_Terra_Docker/Welcome\ to\ WetAI.ipynb ~/notebooks/
cd ~/notebooks && mkdir Apps Projects                   #<-- Create folders
cd ~/notebooks/Apps && mkdir  braingeneers
cd ~/notebooks/Apps/braingeneers && git clone https://github.com/braingeneers/Agora.git && git clone https://github.com/braingeneers/Learn_WetAI.git





############################################
############################################
#.    Additional Installations for Terra
############################################
############################################

# These packages were installed in WetAI by default, but must be installed in Terra version
pip3 install plotly==4.14.3
pip3 install pandas


############################################
############################################
#.    Braingeneers
############################################
############################################

# Code used by all braingeneers
pip install --upgrade git+https://github.com/braingeneers/braingeneerspy.git # install braingeneers python package

### Install Docker
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io
#dockerd & #commented because command doesn't work here
#service docker start # commented because command doesn't work

# Run each individual braingeneers code
cd ~/WetAI_Docker/Code/Users && chmod +x *.sh && for f in *.sh; do bash "$f" -H; done;
rm -rf ~/WetAI_Terra_Docker ~/WetAI_Docker                   #<-- remove previous folders
