# kubernetes
### Kubernetes is an open-source container orchestration system for automating software deployment, scaling, and management.

## - What tools do we require for kubernetes?
#### . minikube - create kubernetes cluster with a single node.
#### . kubectl - command line tool used to run commands against Kubernetes clusters.
#### . kuberadm - used to build Kubernetes (K8s) clusters.

## Installation
### ~ Note: This is for windows os, please use terminal as administrator.
### Install chocolatey, go to powershell run as adminstrator:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; `
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
### Install kubectl:
```
choco install kubernetes-cli
```
### Test to ensure the version you installed is up-to-date:
```
kubectl version --client
```

