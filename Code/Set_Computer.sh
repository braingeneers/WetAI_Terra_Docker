

######################
# Wet AI Interface
######################
VERSION_NAME=v3.0.3
# Set io's Version name in custom.js file
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  ~/WetAI_Terra_Docker/Code/Set_Interface.js

#mkdir ~/.jupyter/custom && mv ~/WetAI_Docker/Code/Set_Interface.js ~/.jupyter/custom/custom.js 
sed -i '$d' ~/.jupyter/custom/custom.js
echo "  require(['custom/Set_Interface']);" >> ~/.jupyter/custom/custom.js
echo "});" >> ~/.jupyter/custom/custom.js
mv ~/WetAI_Terra_Docker/Code/Set_Interface.js ~/.jupyter/custom/


# Allow root access
echo "c.NotebookApp.allow_root = True" >> ~/.jupyter/jupyter_notebook_config.py  


######################
######################
# Old Code
######################
######################


### Generic Software Update
apt update
apt-get install update
conda update -y conda

#pip install plotly



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





