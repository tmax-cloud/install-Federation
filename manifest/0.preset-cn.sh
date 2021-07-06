if [ ! -d img ]; then
   mkdir img
fi

source version.conf

sudo docker pull quay.io/kubernetes-multicluster/kubefed:${FED_VERSION}
sudo docker save quay.io/kubernetes-multicluster/kubefed:${FED_VERSION} > img/kubefed_${FED_VERSION}.tar