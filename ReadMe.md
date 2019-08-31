# Project Kubernetes

## Environment Description

* This setup is created and tested with 3-Node K8 Cluster  running on Ubuntu 16.04
* Two nodes are with Master Role and one Node is Worker Role
* Both Master nodes are un-tainted to deploy pods on them as well.
* Flannel CNI is used for network setup.
* Couple of extra additional tools were also installed - Jenkins(For deployment orchestration) and HAProxy(for load balancing)
* As this setup is running on Local Laptop. Do reach out to Author, if you need to access the Environment.


## Assumptions
* 3 nodes are available and nodes are able to reach each other.
* Load Balancer is available.\
	If not follow instructions in file additionalTools/setup_software_based_load_balancer.sh to setup software based load balancer HAProxy.
* Jenkins server/master & slave is available for orchestration.\
	If not follow instructions in file additionalTools/install_jenkins.sh to setup jenkins master server.
* User have root permission on nodes to run kubeadm commands.


## Installation Instructions
* Install K8 Cluster components (Kubeadm, Kubelet, Kubectl) by following steps in setupK8HACluster folder:\
    [install_docker.sh](setupK8HACluster/install_docker.sh)\
	[install_k8.sh](setupK8HACluster/install_k8.sh)\
	[instantiate_k8.sh](setupK8HACluster/instantiate_k8.sh)\
	[add_master_worker_nodes.sh](setupK8HACluster/add_master_worker_nodes.sh)\
	[setup_kubectl_for_non_root_users.sh](setupK8HACluster/setup_kubectl_for_non_root_users.sh)

* Deploy guestbook application on K8 Cluster and validate the Application/Cluster setup.\
	Follow steps to manually install [deploy_application_guestbook.sh](deployGuestbook/deploy_application_guestbook.sh)\
	or \
	Deploy guestbook via Jenkins pipeline using jenkinsfile [deploy_guestbook_jenkins_pipeline](jenkinsPipeline/deploy_guestbook_jenkins_pipeline.txt)

* Setup HELM on Cluster by following the steps in [setup_hlem.sh](setupHelm/setup_hlem.sh) \
	To control/limit the changes tiller can make on Cluster rbac permission model is used(see file helm_rbac_permissions.yaml)
	and access to tiller is restricted to namespace(airflow).\
	Manually Deploy application "ariflow" using helm to test out the helm and its workings.\
	Airflow is open source scheduling tool.

* Use [deploy_airflow_using_helm_jenkins_pipeline](jenkinsPipeline/deploy_airflow_using_helm_jenkins_pipeline.txt) for deploying 'airflow' application via Jenkins pipeline using helm.

* Create namespace and setup Prometheous by following steps in [setup_prometheus.sh](setupPrometheus/setup_prometheus.sh).\
    Prometheous time-series based data store for Cluster logs.\
	Analysis can be done using visualization tools like Grafana.

* Setup Grafana for data visualization by following steps [grafana_setup.sh](setupGrafana/grafana_setup.sh).\
    Use the images in the folder for pointing Grafana to K8Cluster and Prometheous as data-source creation.
	
* Use [elk_setup.sh](setupElk/elk_setup.sh) for configuring ELK on the K8 Cluster.

* Use [blue_green_deployment.sh](blueGreenDeployment/blue_green_deployment.sh) for testing blue-green deployment model on the K8 Cluster.\
	This is with the assumption that you already have guestbook application deployed on cluster.

* Use [canary_deploy.sh](canaryDeployment/canary_deploy.sh) for testing canary deployment model on the K8 Cluster.\
	This is with the assumption that you already have guestbook application deployed on cluster.
