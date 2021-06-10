sudo cp bin/kubefedctl /usr/local/bin/kubefedctl

sudo docker load < img/kubefed_${FED_VERSION}.tar
sudo docker tag quay.io/kubernetes-multicluster/kubefed:${FED_VERSION} ${REGISTRY}/kubernetes-multicluster/kubefed:${FED_VERSION}
sudo docker push ${REGISTRY}/kubernetes-multicluster/kubefed:${FED_VERSION}

kubectl apply -f yaml/_install/1.federation-crd.yaml

cp yaml/_template/federation-template.yaml yaml/_install/2.federation-${FED_VERSION}.yaml
sed -i 's/quay.io\/kubernetes-multicluster\/kubefed:${FED_VERSION}/'"${REGISTRY}"'\/kubernetes-multicluster\/kubefed:${FED_VERSION}/g' yaml/_install/2.federation-${FED_VERSION}.yaml
sed -i 's/${FED_NS}/'"${FED_NS}"'/g' yaml/_install/2.federation-${FED_VERSION}.yaml
sed -i 's/${FED_VERSION}/'"${FED_VERSION}"'/g' yaml/_install/2.federation-${FED_VERSION}.yaml
sed -i 's/${CA_CERT}/'"${CA_CERT}"'/g' yaml/_install/2.federation-${FED_VERSION}.yaml
sed -i 's/${CA_KEY}/'"${CA_KEY}"'/g' yaml/_install/2.federation-${FED_VERSION}.yaml
sed -i 's/${CA_BUNDLE}/'"${CA_BUNDLE}"'/g' yaml/_install/2.federation-${FED_VERSION}.yaml
kubectl apply -f yaml/_install/2.federation-${FED_VERSION}.yaml