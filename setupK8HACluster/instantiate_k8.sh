##Initialize the K8 Cluster using the config file 
kubeadm init --config=kubeadm-config.yaml --upload-certs

##Enable config needed for networking
sysctl net.bridge.bridge-nf-call-iptables=1


## Deploy CNI POD network - Flannel
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/62e44c867a2846fefb68bd5f178daf4da3095ccb/Documentation/kube-flannel.yml

## At this time the Pods should be in running state 
kubectl get pods --all-namespaces