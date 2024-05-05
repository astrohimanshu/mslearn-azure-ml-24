#! /usr/bin/bash

ENDPOINT_NAME=batch-XXXXXXXXXXXXXX
DEPLOYMENT_NAME=classifier-diabetes-mlflow
DATASET_ID=$(az ml data show -n patient-data-unlabeled --label latest | jq -r .id)

var=`az ml batch-endpoint invoke --name $ENDPOINT_NAME \
--deployment-name $DEPLOYMENT_NAME --experiment-name "my-batch-job-experiment-cli" \
 --input $DATASET_ID --debug`

echo $var

