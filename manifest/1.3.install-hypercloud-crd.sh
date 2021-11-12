HYPERCLOUD_CRD="clusterrolebinding cj ds hpa po sts" 
for crd in ${HYPERCLOUD_CRD}; do
    kubefedctl enable ${crd} --federated-group types.kubefed.io
done