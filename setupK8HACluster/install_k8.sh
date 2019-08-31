#disabled the swap
#configured the /etc/hosts
#installed ssh on VMs
#Validated n/w b/w nodes
#disable firewall
apt-get update
apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubernetes-cni=0.7.5-00 kubelet=1.13.5-00 kubeadm=1.13.5-00 kubectl=1.13.5-00
apt-mark hold kubelet kubeadm kubectl


systemctl daemon-reload
systemctl restart kubelet

##Upgrade Kubernetes components to latest version #1.15.3
apt-get update
apt-get upgrade kubeadm kubelet kubectl