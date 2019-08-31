## Setup service account and permissions for elk setup

kubectl apply -f elk_permissions.yaml

## Initialize Helm in monitoring namespace
helm init --tiller-namespace=monitoring --service-account=tiller

## Deploy Elasticsearch and elk charts using helm

helm install --name elk stable/elastic-stack --tiller-namespace monitoring --namespace monitoring

## validate deployment
helm ls --all --tiller-namespace monitoring


## Edit Kibana Service to be on NodePort Config to expose on node's IP
kubectl edit svc elk-kibana -n monitoring
#change 
	type: ClusterIP
#to
	type: NodePort


## Get the hostname(or use node's IP) for the SVC created for Kibana. as service is create as NodePort Type
#kubectl get pods -n development -o wide

##Get port name for the SVC created for frontend
#kubectl get svc -n development


## Test URL for Kibana
#http://***.***.***.***:32095/