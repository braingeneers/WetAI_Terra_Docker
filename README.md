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
**Run Original Image**
```
docker run -it -p 8017:8000 --name terra-test   --entrypoint /bin/bash us.gcr.io/broad-dsp-gcr-public/terra-jupyter-python:1.0.2
```
**Build Docker Image**
```
docker build --no-cache -t braingeneers/wetai:latest .  
```
**Remove Local Changes**
```
git checkout -- .
```
**Remove Unused Images**
This command cleans up your `docker images` envirnonent [link here](https://stackoverflow.com/questions/33913020/docker-remove-none-tag-images). 
```
docker image prune
```

