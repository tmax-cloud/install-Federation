source version.conf

kubectl delete federatedtypeconfig -n kube-federation-system --all
kubectl delete -f yaml/federation-delete-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-crd-${FED_VERSION}.yaml
sudo rm -f /usr/local/bin/kubefedctl