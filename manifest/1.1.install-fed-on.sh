source version.conf

chmod +x bin/kubefedctl
sudo cp bin/kubefedctl /usr/local/bin/kubefedctl

kubectl apply -f yaml/federation-crd-${FED_VERSION}.yaml

sed -i 's/${FED_VERSION}/'"${FED_VERSION}"'/g' yaml/federation-${FED_VERSION}.yaml
kubectl apply -f yaml/federation-${FED_VERSION}.yaml
