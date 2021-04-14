cp -r $FILE_DIR/img $HOME/install-federation/img
sudo cp $FILE_DIR/bin/kubefedctl /usr/local/bin/kubefedctl

docker load < img/kubefed_$FED_VERSION.tar
docker tag quay.io/kubernetes-multicluster/kubefed:$FED_VERSION $REGISTRY/kubernetes-multicluster/kubefed:$FED_VERSION
docker push $REGISTRY/kubernetes-multicluster/kubefed:$FED_VERSION

kubectl apply -f yaml/_install/1.federation-crd.yaml

cp yaml/_template/federation-template.yaml yaml/_install/2.federation-v${FED_VERSION}.yaml
sed -i 's/quay.io\/kubernetes-multicluster\/kubefed:${FED_VER}/'${REGISTRY}'\/kubernetes-multicluster\/kubefed:${FED_VER}/g' yaml/_install/2.federation-v${FED_VER}.yaml
sed -i 's/${FED_NS}/'${FED_NS}'/g' yaml/_install/2.federation-v${FED_VERSION}.yaml
sed -i 's/${FED_VERSION}/'${FED_VERSION}'/g' yaml/_install/2.federation-v${FED_VERSION}.yaml
kubectl apply -f yaml/_install/2.federation-v${FED_VERSION}.yaml