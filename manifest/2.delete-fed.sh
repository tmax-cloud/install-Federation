kubectl delete -f yaml/_install/2.federation-v${FED_VERSION}.yaml
kubectl delete -f yaml/_install/1.federation-crd.yaml
sudo rm -f /usr/local/bin/kubefedctl \
    yaml/_install/2.federation-v${FED_VERSION}.yaml