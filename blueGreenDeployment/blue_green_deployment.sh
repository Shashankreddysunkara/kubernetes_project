## Create deployment with v3 of application 
## and create service to point to v3 version deployment

kubectl apply -f guestbook_v3.yaml -n development

kubectl apply -f frontend_service.yaml -n development

##### Notice the End Point for service are point to IPs pods created with v3 of application
#kewal@k8master:~/guestbook/examples/guestbook$ kubectl describe svc frontend -n development
#Name:                     frontend
#Namespace:                development
#Labels:                   app=guestbook
#                          tier=frontend
#                          version=v3
#Annotations:              kubectl.kubernetes.io/last-applied-configuration:
#                            {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"app":"guestbook","tier":"frontend","version":"v3"},"name":"fro...
#Selector:                 app=guestbook,tier=frontend
#Type:                     NodePort
#IP:                       10.107.42.37
#Port:                     <unset>  80/TCP
#TargetPort:               80/TCP
#NodePort:                 <unset>  32520/TCP
#Endpoints:                10.244.0.57:80,10.244.1.20:80,10.244.2.238:80
#Session Affinity:         None
#External Traffic Policy:  Cluster
#Events:                   <none>
#
#kewal@k8master:~/guestbook/examples/guestbook$ kubectl get pods -l version=v3 -o wide -n development
#NAME                          READY   STATUS    RESTARTS   AGE   IP             NODE       NOMINATED NODE   READINESS GATES
#frontendv3-7cf4ff6b7c-hj2q2   1/1     Running   0          39s   10.244.2.238   k8node2    <none>           <none>
#frontendv3-7cf4ff6b7c-nfq5p   1/1     Running   0          38s   10.244.0.57    k8master   <none>           <none>
#frontendv3-7cf4ff6b7c-tzx7l   1/1     Running   0          38s   10.244.1.20    k8node1    <none>           <none>


## Now deploy new version of application v4
kubectl apply -f guestbook_v4.yaml -n development

##To repoint service to v4 version of application. Edit the service
kubectl edit svc frontend -n development
#change
  selector:
    app: guestbook
    tier: frontend
    version: v3
#to
  selector:
    app: guestbook
    tier: frontend
    version: v4


## Notice that how the Endpoints for service are now point to IPs of v4 of application deployment
#kewal@k8master:~/guestbook/examples/guestbook$ kubectl describe svc frontend -n development
#Name:                     frontend
#Namespace:                development
#Labels:                   app=guestbook
#                          tier=frontend
#Annotations:              kubectl.kubernetes.io/last-applied-configuration:
#                            {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"app":"guestbook","tier":"frontend"},"name":"frontend","namespa...
#Selector:                 app=guestbook,tier=frontend,version=v4
#Type:                     NodePort
#IP:                       10.102.93.174
#Port:                     <unset>  80/TCP
#TargetPort:               80/TCP
#NodePort:                 <unset>  30564/TCP
#Endpoints:                10.244.0.58:80,10.244.1.21:80,10.244.2.239:80
#Session Affinity:         None
#External Traffic Policy:  Cluster
#Events:                   <none>
#kewal@k8master:~/guestbook/examples/guestbook$ kubectl get pods -l version=v4 -o wide -n development
#NAME                          READY   STATUS    RESTARTS   AGE    IP             NODE       NOMINATED NODE   READINESS GATES
#frontendv4-856cdc49ff-446sb   1/1     Running   0          9m4s   10.244.1.21    k8node1    <none>           <none>
#frontendv4-856cdc49ff-7sfwz   1/1     Running   0          9m4s   10.244.0.58    k8master   <none>           <none>
#frontendv4-856cdc49ff-fp5gl   1/1     Running   0          9m4s   10.244.2.239   k8node2    <none>           <none>
