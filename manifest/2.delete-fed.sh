source version.conf

sed -i 's/${FED_NS}/'"${FED_NS}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
sed -i 's/${FED_VERSION}/'"${FED_VERSION}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
sed -i 's/${CA_CERT}/'"${CA_CERT}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
sed -i 's/${CA_KEY}/'"${CA_KEY}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
sed -i 's/${CA_BUNDLE}/'"${CA_BUNDLE}"'/g' yaml/federation-delete-${FED_VERSION}.yaml
kubectl delete federatedtypeconfig -n kube-federation-system --all
kubectl delete -f yaml/federation-delete-${FED_VERSION}.yaml
kubectl delete -f yaml/federation-crd-${FED_VERSION}.yaml
sudo rm -f /usr/local/bin/kubefedctl