## Create monitoring namespace
kubectl apply -f monitoring_namespace.yaml


# Get Prometheus files

git clone https://github.com/bibinwilson/kubernetes-prometheus

## Deploy K8 components for Prometheus

kubectl apply -f prometheus-service.yaml
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f config-map.yaml
kubectl apply -f clusterRole.yaml


## Validate installation and deafault alerts an services in UI
##http://***.***.***.***:30000/graph