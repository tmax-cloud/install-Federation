source version.conf

fedConfig=("clusterrolebindings.rbac.authorization.k8s.io" "cronjobs.batch" "daemonsets.apps" "horizontalpodautoscalers.autoscaling" "pods" "statefulsets.apps")
crd=("federatedclusterrolebindings" "federatedcronjobs" "federateddaemonsets" "federatedhorizontalpodautoscalers" "federatedpods" "federatedstatefulsets")
group=".types.kubefed.io"
for i in ${!crd[*]}; do
    kubectl -n kube-federation-system delete federatedtypeconfig "${fedConfig[$i]}"
    kubectl delete crd "${crd[$i]}""$group"
    #echo "${fedConfig[$i]}"
    #echo "${crd[$i]}""$group"
done

kubectl delete -f yaml/federation-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-crd-${FED_VERSION}.yaml
sudo rm -f /usr/local/bin/kubefedctl

#sed -i 's/${FED_VERSION}/'"${FED_VERSION}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
#kubectl delete federatedtypeconfig -n kube-federation-system --all
#kubectl delete -f yaml/federation-delete-${FED_VERSION}.yaml
#kubectl delete -f yaml/federation-crd-${FED_VERSION}.yaml
#kubectl delete -f yaml/federation-hypercloud-crd-delete-${FED_VERSION}.yaml

