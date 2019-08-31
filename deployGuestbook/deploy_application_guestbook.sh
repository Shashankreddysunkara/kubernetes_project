## Create Namespace
kubectl apply -f development_ns.yaml

## Clone git repo for application
git clone https://github.com/kubernetes/examples.git
cd guestbook

## Deploy application components in following Order
kubectl apply -f redis-master-deployment.yaml -n development
kubectl apply -f redis-master-service.yaml -n development
kubectl apply -f redis-slave-deployment.yaml -n development
kubectl apply -f redis-slave-service.yaml -n development
kubectl apply -f frontend-deployment.yaml -n development
kubectl apply -f frontend-service.yaml -n development

## Test URL 
## Get the hostname(or use node's IP) for the SVC created for frontend. as service is create as NodePort Type
#kubectl get pods -n development -o wide

##Get port name for the SVC created for frontend
#kubectl get svc -n development

##Test URL 
#http://***.***.***.***:32536/