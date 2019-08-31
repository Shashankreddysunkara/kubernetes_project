## Create two deployments of same application with different version of container(application version) 

kubectl apply -f guestbook_v3.yaml

kubectl apply -f guestbook_v4.yaml


#### Notices the IPs for the pods
#kewal@k8master:~/guestbook/examples/guestbook$ kubectl get pods -n development -l app=guestbook -o wide
#NAME                          READY   STATUS    RESTARTS   AGE     IP             NODE       NOMINATED NODE   READINESS GATES
#frontend-856cdc49ff-88z86     1/1     Running   0          6m56s   10.244.2.235   k8node2    <none>           <none>
#frontend-856cdc49ff-htl8w     1/1     Running   0          6m56s   10.244.1.17    k8node1    <none>           <none>
#frontend-856cdc49ff-zqvst     1/1     Running   0          6m56s   10.244.0.53    k8master   <none>           <none>
#frontendv3-7cf4ff6b7c-lc4ph   1/1     Running   0          6m26s   10.244.2.236   k8node2    <none>           <none>
#frontendv3-7cf4ff6b7c-rdtw9   1/1     Running   0          6m26s   10.244.1.18    k8node1    <none>           <none>
#frontendv3-7cf4ff6b7c-vl6nh   1/1     Running   0          6m26s   10.244.0.54    k8master   <none>           <none>
#
### Now validate that frontend service/endpoints is redriecting traffic to all six IPs(pods) running two different version of same application
#kewal@k8master:~/guestbook/examples/guestbook$ kubectl describe ep frontend -n development
#Name:         frontend
#Namespace:    development
#Labels:       app=guestbook
#              tier=frontend
#Annotations:  endpoints.kubernetes.io/last-change-trigger-time: 2019-08-30T16:31:29Z
#Subsets:
#  Addresses:          10.244.0.53,10.244.0.54,10.244.1.17,10.244.1.18,10.244.2.235,10.244.2.236
#  NotReadyAddresses:  <none>
#  Ports:
#    Name     Port  Protocol
#    ----     ----  --------
#    <unset>  80    TCP