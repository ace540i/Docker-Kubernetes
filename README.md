#check if Docker is running
tasklist | findstr /i "docker"

# Docker-Kubernetes
# install Docker minikube, kubectl
minikube start
kubectl cluster-info
    # shows local IP and DNS container interface
kubectl get nodes
    # minikube cluster 
    # kubernetes version
kubectl get namespaces 
kubectl get pods -A
kubectl get services -A 
# create namespaces
# namespaces.yaml --- means new document
kubectl apply -f namespace.yaml
# create new deployment using deployment.yaml
kubectl apply -f deployment.yaml
kubectl get deployment -n development
kubectl get pods -n development
kubectl delete pod pod-name
kubectl get pods -n development

kubectl describe pod pod-name
# pod info and log

# deploy test app using busybox.yaml
kubectl apply -f busybox.yaml
kubectl get pods

# test container app listening on 3000
# new terminal 
kubectl get pods -n development -o wide

# go inside busybox container run wget command interactive terminal
# copy name of pod
kubectl exec -it busybox-6c747767dd-zszdm -- /bin/sh
# wget
# get ipaddress for one of the pods in development namespace
# inside container connect to app
# make get request
wget 10.244.0.6:3000
cat index.html
# app shows info about pod
# view app logs
exit
kubectl get pods -n development
kubectl logs pod-info-deployment-68c8476764-9tn2h -n development
