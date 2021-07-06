source version.conf

kubectl delete -f yaml/federation-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-crd.yaml
sudo rm -f /usr/local/bin/kubefedctl