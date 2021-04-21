if [ ! -d img ]; then
   mkdir img
fi

if [ ! -d bin ]; then
   mkdir bin
fi

sudo docker pull quay.io/kubernetes-multicluster/kubefed:v${FED_VERSION}
sudo docker save quay.io/kubernetes-multicluster/kubefed:v${FED_VERSION} > img/kubefed_v${FED_VERSION}.tar

curl -LO https://github.com/kubernetes-sigs/kubefed/releases/download/v${FED_VERSION}/kubefedctl-${FED_VERSION}-${OS_TYPE}-${ARCH_TYPE}.tgz
tar -zxvf kubefedctl-*.tgz
chmod +x kubefedctl
mv kubefedctl bin/kubefedctl