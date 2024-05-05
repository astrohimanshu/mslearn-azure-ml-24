# get dataset id
DATASET_ID=$(az ml data show -n heart-dataset-unlabeled --label latest | jq -r .id)

# invoke deployment
az ml batch-endpoint invoke --name $ENDPOINT_NAME --input $DATASET_ID

or az ml batch-endpoint invoke --name $ENDPOINT_NAME --set inputs.heart_dataset.type="uri_folder" inputs.heart_dataset.path=$DATASET_ID

# yaml inputs
inputs:
  heart_dataset: azureml:/<datasset_name>@latest

az ml batch-endpoint invoke --name $ENDPOINT_NAME --file inputs.yml
# full deploy command

az ml batch-endpoint invoke --name $ENDPOINT_NAME --deployment-name $DEPLOYMENT_NAME --experiment-name "my-batch-job-experiment-cli" --input https://azuremlexampledata.blob.core.windows.net/data/heart-disease-uci/data

az ml batch-endpoint invoke --name $ENDPOINT_NAME --deployment-name $DEPLOYMENT_NAME --experiment-name "my-batch-job-experiment-cli" --input $DATASET_ID

DATASET_ID=$(az ml data show -n patient-data-unlabeled --label latest | jq -r .id)