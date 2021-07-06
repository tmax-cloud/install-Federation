source version.conf

sudo cp bin/kubefedctl /usr/local/bin/kubefedctl

kubectl apply -f yaml/federation-crd.yaml

sed -i 's/${FED_NS}/'"${FED_NS}"'/g' yaml/federation-${FED_VERSION}.yaml
sed -i 's/${FED_VERSION}/'"${FED_VERSION}"'/g' yaml/federation-${FED_VERSION}.yaml
sed -i 's/${CA_CERT}/'"${CA_CERT}"'/g' yaml/federation-${FED_VERSION}.yaml
sed -i 's/${CA_KEY}/'"${CA_KEY}"'/g' yaml/federation-${FED_VERSION}.yaml
sed -i 's/${CA_BUNDLE}/'"${CA_BUNDLE}"'/g' yaml/federation-${FED_VERSION}.yaml
kubectl apply -f yaml/federation-${FED_VERSION}.yaml