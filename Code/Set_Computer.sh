

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
conda install -y -c conda-forge  rise








