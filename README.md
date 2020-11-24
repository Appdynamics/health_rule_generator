# health_rule_generator
## Overview

Automates the generation of Health Rules and Dashboards for use with ConfigMyApp

## Runtime

See each PS1 File for run example, makeall_gen will run all other files sequentially in the instance that everything is to be ran (most likely scenario)

## ConfigMyApp Commands Used In Testing

### Upload Health Rules:
Move generated rules to the health_rules folder in CMA, then:
./start.sh --controller-host=tpicap-dev.saas.appdynamics.com --use-https --controller-port=443 --application-name=creditdeal-qa --account=tpicap-dev --username=sfowler --password=*** --health-rules-only

### Upload Custom Dashboard:
Move generated Dashboard to the custom_dashboards folder in CMA, then:
./start.sh --controller-host=tpicap-dev.saas.appdynamics.com --use-https --controller-port=443 --application-name=creditdeal-qa --account=tpicap-dev --username=sfowler --password=*** --upload-custom-dashboard
