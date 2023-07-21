.\helm.exe repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
.\helm.exe repo update

.\helm.exe install ingress-nginx ingress-nginx/ingress-nginx `
    --namespace ingress `
    --create-namespace `
    --set controller.replicaCount=2 `
    --set controller.nodeSelector."kubernetes\.io/os"=linux `
    --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux `
    --set controller.service.loadBalancerIP=10.0.0.100 `
    --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"=true `
    --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz `
	-f csi.yaml