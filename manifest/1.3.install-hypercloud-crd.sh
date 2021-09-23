HYPERCLOUD_CRD="po hpa ds sts cj clusterrolebinding" 
for crd in ${HYPERCLOUD_CRD}; do
    kubefedctl enable ${crd} --federated-group types.kubefed.io
done