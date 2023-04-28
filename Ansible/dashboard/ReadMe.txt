====================================>> Deploy Dashboard UI
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

====================================>> Get Bearer Token
kubectl -n kubernetes-dashboard create token admin-user

====================================>> Remove the admin ServiceAccount and ClusterRoleBinding
kubectl -n kubernetes-dashboard delete serviceaccount admin-user
kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user