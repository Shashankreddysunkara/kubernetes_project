## Setup Grafana , see below link for more information
##https://medium.com/htc-research-engineering-blog/monitoring-kubernetes-clusters-with-grafana-e2a413febefd

## Deploy grafana on K8

kubectl apply -f grafana.yaml

## Expose the grafana via service Node's IP
kubectl expose deployment grafana --type=NodePort --namespace=monitoring

## Get the hostname(or use node's IP) for the SVC created for frontend. as service is create as NodePort Type
#kubectl get pods -n development -o wide

##Get port name for the SVC created for frontend
#kubectl get svc -n development

## Validate login to grafana
## Test URL 
#http://***.***.***.***:30314
#admin/******


## Deploy components for log forwarding, metrics collection and permissions for the service a/c
kubectl apply -f grafana_node_exporter_ds.yaml
kubectl apply -f grafana_metrics_deployment.yaml
kubectl apply -f grafana_service_ac_permissions.yaml

## Configure prometheus and Kube cluster connection in Grafana UI
## See Picture "prometheus_datasource.png" and "K8Cluster_config.png"
## Validate Grafana is receiving data from nodes,pods etc. See picture "grafana_dashboard.png"