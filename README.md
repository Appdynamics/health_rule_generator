# ConfigMyApp Asset Generator 

## Overview

Automates the generation of Health Rules and Dashboards for use with ConfigMyApp

## Runtime

See each PS1 File for run example, `makeall_gen.ps1` will run all other files sequentially in the instance that everything is to be ran 

## ConfigMyApp Commands Used In Testing
### Get ConfigMyApp 
 
To run ConfigMyApp locally, download it from: 
https://github.com/Appdynamics/ConfigMyApp/releases

Or use the Docker image `docker pull appdynamicscx/configmyapp:latest`

Read the docs - https://appdynamics.github.io/ConfigMyApp 
### Upload Health Rules:
Move generated rules to the health_rules folder in CMA, then:
```
./start.sh --controller-host=tpicap-dev.saas.appdynamics.com \ 
           --use-https \
           --controller-port=443 \ 
           --application-name=creditdeal-qa \ 
           --account= account_name \ 
           --username=username \
           --password=*** \ 
           --health-rules-only
```
### Upload Custom Dashboard:
Move generated Dashboard to the custom_dashboards folder in CMA, then:

```
./start.sh --controller-host=tpicap-dev.saas.appdynamics.com \
           --use-https \ 
           --controller-port=443 \
           --application-name=creditdeal-qa \
           --account=account_name \
           --username=username \
           --password=*** \
           --upload-custom-dashboard 
```
Note that you use can environment variables and/or run-time variables. It's best to use environment variables if you're running ConfigMyApp from Jenkins or Docker 

## Running from Jenkins 

Please refer to the `jenkins` folder
