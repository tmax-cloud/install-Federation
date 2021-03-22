kubectl delete federatedtypeconfig -n kube-federation-system --all
kubectl delete -f yaml/2.fedration-v${FED_VERSION}.yaml
kubectl delete -f yaml/1.federation-crd.yaml
rm -f /usr/local/bin/kubefedctl \
    yaml/_install/2.federation-v${FED_VERSION}.yaml