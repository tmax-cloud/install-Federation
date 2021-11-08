source version.conf

sed -i 's/${FED_VERSION}/'"${FED_VERSION}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
kubectl delete federatedtypeconfig -n kube-federation-system --all
kubectl delete -f yaml/federation-delete-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-crd-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-hypercloud-crd-delete-${FED_VERSION}.yaml
sudo rm -f /usr/local/bin/kubefedctl
