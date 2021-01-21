## Velero Lab Playbook
## This playbook walks you through setting up a basic velero install/backup/restore

- % kubectl delete namespace velero
	• Get rid of the existing velero server install

- Install docker desktop
	• https://www.docker.com/products/docker-desktop

- Install KIND
	• https://kind.sigs.k8s.io/
	• % Brew install kind
	• kind is a tool for running local Kubernetes clusters using Docker container “nodes”.
	kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

- Open a new terminal session
	• Preferences with 14pt font

- Install the velero client
	• % Brew install velero

- Test the client install
	• % velero version

- Getting cmd line help
	• % velero help | more

- Lets create a cluster using kind
	• % kind create cluster --name=velero-test
	• % kind get clusters
	• % kubectl cluster-info --context kind-velero-test
	• % kubectl config get-contexts
	• % kubectl get namespaces

- Lets create a namespace
	• % kubectl create namespace tamlab
	• % kubectl get namespaces

- Lets put something into the namespace
	• Create a pod in the namespace
	• % kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:1 --namespace=tamlab
	• % Kubectl run nginx --image=nginx:1.7.12 --namespace=tamlab
	• % kubectl get pods --namespace=tamlab

- Lets go into AWS S3 and create a bucket to hold the backup
	• Velero-tamlab
	
- Install the velero server
	• ./velero-install.sh
	• kubectl logs deployment/velero -n velero
	• Velero version
	• Kubectl get namespaces

- Now lets backup the tamlab namespace to aws
	• % velero backup create tamlab-backup-0x --include-namespaces tamlab
	• % velero backup describe tamlab-backup-0x

- Lets look at the backup in AWS

- Let's simulate a disaster
	• % kubectl delete namespace tamlab
	• % kubectl get namespaces

- Let's restore the namespace from the backup
	• % velero backup get
	• % velero restore create --from-backup tamlab-backup
	• % kubectl get namespaces
	• % kubectl get pods --namespace=tamlab
	
- That's it!
