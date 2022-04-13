test4

VERSION_NAME=v4.0.2
# Set io's Version name in custom.js file
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  /home/WetAI_Terra_Docker/Code/Set_Interface.js
# Reference Code: https://github.com/braingeneers/WetAI_Docker/blob/main/Code/Set_Computer.sh


############################################
############################################
#.    Code From Original io
############################################
############################################

### Generic Software Update
#apt update; apt-get install update; conda update -y conda

### Install nb-extensiosn 
# conda install -y -c conda-forge  rise  #conda install -y jupyterlab # removed because never used 
conda install -y -c conda-forge jupyter_contrib_nbextensions
jupyter nbextensions_configurator enable
for package in collapsible_headings/main varInspector/main notify/notify toc2/main codefolding/main hide_header/main hide_input_all/main table_beautifier/main codefolding/edit contrib_nbextensions_help_item/main python-markdown/main move_selected_cells/main help_panel/help_panel splitcell/splitcell tree-filter/index; do jupyter nbextension enable $package; done;


# Set Files from wet_io Github
#    Set custom.js file for WetAI javscript code -- It took work to figure out where to put these files
#    Check out the docker link for the Terra base image to see where they put files
#    https://github.com/DataBiosphere/terra-docker/blob/master/terra-jupyter-base/custom/extension_entry_jupyter.js
#    https://github.com/DataBiosphere/terra-docker/blob/master/terra-jupyter-base/Dockerfile
sed -i '$d' $JUPYTER_HOME/custom/extension_entry_jupyter.js
echo "  require(['custom/Set_Interface']);" >> $JUPYTER_HOME/custom/extension_entry_jupyter.js
echo "});" >> $JUPYTER_HOME/custom/extension_entry_jupyter.js
mv /home/WetAI_Terra_Docker/Code/Set_Interface.js $JUPYTER_HOME/custom/


# Code used by all braingeneers
pip install --upgrade git+https://github.com/braingeneers/braingeneerspy.git # install braingeneers python package

