##You can now join any number of the control-plane node running the following command on each as root:
### Add additional Node as Master
kubeadm join ***.***.***.***::8282 --token ******************\
    --discovery-token-ca-cert-hash sha256:************************************************** \
    --control-plane --certificate-key **************************************************

## Add Worker/Slave Node to Kubernetes Cluster
kubeadm join ***.***.***.***:8282 --token ******** \
    --discovery-token-ca-cert-hash sha256:************************************************** 


## Remove taints to schedule and deploy pods on Master Nodes
kubectl taint nodes --all node-role.kubernetes.io/master-