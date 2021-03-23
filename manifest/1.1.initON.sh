curl -LO https://github.com/kubernetes-sigs/kubefed/releases/download/v${FED_VERSION}/kubefedctl-${FED_VERSION}-${OS_TYPE}-${ARCH_TYPE}.tgz
tar -zxvf kubefedctl-*.tgz
chmod u+x kubefedctl
mv kubefedctl /usr/local/bin/kubefedctl

kubectl apply -f yaml/_install/1.federation-crd.yaml

cp yaml/_template/federation-template.yaml yaml/_install/2.federation-v${FED_VERSION}.yaml
sed -i 's/${FED_NS}/'${FED_NS}'/g' yaml/_install/2.federation-v${FED_VERSION}.yaml
sed -i 's/${FED_VERSION}/'${FED_VERSION}'/g' yaml/_install/2.federation-v${FED_VERSION}.yaml
kubectl apply -f yaml/_install/2.federation-v${FED_VERSION}.yaml