source version.conf

#kubectl delete federatedtypeconfig -n kube-federation-system --all
kubectl -n ${FED_NS} delete federatedtypeconfig \
    pods \
    horizontalpodautoscalers.autoscaling \
    daemonsets.apps statefulsets.apps \
    cronjobs.batch
kubectl -n ${FED_NS} delete crd \
    federatedcronjobs.types.kubefed.io \
    federateddaemonsets.types.kubefed.io \
    federatedhorizontalpodautoscalers.types.kubefed.io \
    federatedpods.types.kubefed.io \
    federatedstatefulsets.types.kubefed.io
kubectl delete -f yaml/federation-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-crd-${FED_VERSION}.yaml
sudo rm -f /usr/local/bin/kubefedctl