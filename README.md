# kubernetes
### Kubernetes is an open-source container orchestration system for automating software deployment, scaling, and management.

## - What tools do we require for kubernetes?
#### . kubelet - create kubernetes cluster.
#### . kubectl - command line tool used to run commands against Kubernetes clusters.
#### . kuberadm - used to build Kubernetes (K8s) clusters.

### Get the current metric server deployment (* Make you have metric-server.yaml)
```
kubectl get deployment metrics-server -n kube-system -o yaml > metrics-server.yaml
```
### Apply the modified deployment manifest
```
kubectl apply -f metrics-server.yaml -n kube-system
```

