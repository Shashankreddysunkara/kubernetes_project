## Setup Helm

curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh


## create Namespace in kubernetes cluster
kubectl apply -f helm_namespace.yaml

## Provide premissions to tiller user to create resources in K8 Cluster
kubectl apply -f helm_rbac_permissions.yaml

## Initialize Helm
helm init --tiller-namespace=airflow --service-account=tiller

## Install application/chart using helm
helm install stable/airflow --tiller-namespace airflow --namespace airflow --name airflow

## Use below command to validate status of deployment
helm ls --all airflow --tiller-namespace airflow

## Use below command to validate status of deployment
##helm delete --purge airflow --tiller-namespace airflow