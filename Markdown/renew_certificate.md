## K8s Master
### Confirm Expiration
```
sudo kubeadm certs check-expiration
```
#
### Renew All Certs
```
sudo kubeadm certs new all
```
#
### Restart Kubelet
```
sudo systemctl restart kubelet.service
```
#
### Update Kubeconfig files
```
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
#
### Verify
```
sudo kubectl get nodes -o wide
sudo kubeadm certs check-expiration
```