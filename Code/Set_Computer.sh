
VERSION_NAME=v3.0.1
# Set io's Version name in custom.js file
sed -i "s/{VERSION_NAME}/$VERSION_NAME/g"  ~/WetAI_Terra_Docker/Code/Set_Interface.js

#mkdir ~/.jupyter/custom && mv ~/WetAI_Docker/Code/Set_Interface.js ~/.jupyter/custom/custom.js 
sed '$d' ~/.jupyter/custom/custom.js 

pip install plotly




######################
# Wet AI Interface
######################







