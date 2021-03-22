docker pull quay.io/kubernetes-multicluster/kubefed:$FED_VERSION
docker save quay.io/kubernetes-multicluster/kubefed:$FED_VERSION > img/kubefed_$FED_VERSION.tar

curl -L https://github.com/kubernetes-sigs/kubefed/releases/download/v${FED_VERSION}/kubefedctl-${FED_VERSION}-${OS_TYPE}-${ARCH_TYPE}.tgz
tar -zxvf kubefedctl-*.tgz