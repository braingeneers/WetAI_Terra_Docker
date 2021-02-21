# WetAI_Terra_Docker
This is the version of WetAI that runs on Terra. This project is still in development. [Here's a link](https://github.com/braingeneers/WetAI_Docker) to the original WetAI. 


## Resources related to Terra:
* [Youtube Tutorials](https://www.youtube.com/channel/UCkXAqpR5Hk1ZmNd2-1K2l5Q/playlists)
* [Terra Docker Github](https://github.com/DataBiosphere/terra-docker/tree/master/terra-jupyter-python)
* [Terra Image Names](https://console.cloud.google.com/gcr/images/broad-dsp-gcr-public/US/terra-jupyter-python?gcrImageListsize=30)

## Docker Commands
**Run Command**
```
docker run -it -p 8001:8000 --name terra-test  --user root --entrypoint /bin/bash braingeneers/wetai:v3.0.0
```
