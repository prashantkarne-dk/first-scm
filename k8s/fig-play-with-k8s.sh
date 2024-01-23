#!/bin/bash
## Setup http://labs.play-with-k8s.com/
#
# Inspired heavily by: https://gist.github.com/jjo/78f60702fbfa1cbec7dd865f67a3728a
# Some dev-tools omitted, changes in parenthesis.
#
# Run with:
# bash -x <( curl -L https://gist.github.com/yogeek/e0dc5e16e158815e7bbb77b896cad3c6/raw/fig-play-with-k8s.sh )
#

# Initialize cluster and FIXUP some play-with-k8s annoyances (fixed kube-dashboard shortlink, update port-number)
test -d /etc/kubernetes/pki || (
echo ""
echo "###########################################################################################################"
echo "kubeadm init"
echo "###########################################################################################################"
kubeadm init --apiserver-advertise-address $(hostname -i) | tee ~/kubeadm-init.log
echo ""
echo ""

sleep 20

echo "###########################################################################################################"
echo "Waiting for all deployment except coredns to be ready..."
echo "###########################################################################################################"
required_pods_number=$(kubectl get pods -l k8s-app!=kube-dns -n kube-system --no-headers | wc -l) 
while [[ "$(kubectl get pods -l k8s-app!=kube-dns -n kube-system --field-selector=status.phase==Running --no-headers | wc -l)" != "${required_pods_number}" ]]; do 
  echo "waiting system pods to be ready..."
  sleep 2
done

echo ""
echo "###########################################################################################################"
echo "apply weave cni"
echo "###########################################################################################################"
kubectl apply -n kube-system -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 -w0)"
echo ""
echo ""
echo "###########################################################################################################"
echo "waiting weave pods to be ready..."
echo "###########################################################################################################"
weave_pods_number=$(kubectl get pods -l k8s-app==kube-dns -n kube-system --no-headers | wc -l) 
while [[ "$(kubectl get pods -l k8s-app==kube-dns -n kube-system --field-selector=status.phase==Running --no-headers | wc -l)" != "${weave_pods_number}" ]]; do 
  echo "waiting system pods to be ready..."
  sleep 2
done
echo ""
echo ""
echo "###########################################################################################################"
echo "authorize pod schedulation on master"
echo "###########################################################################################################"
kubectl taint nodes --all node-role.kubernetes.io/master-
echo ""
echo "###########################################################################################################"
echo "apply dashboard"
echo "###########################################################################################################"
curl -L -s https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml | sed 's/targetPort: 8443/targetPort: 8443\n  type: LoadBalancer/' | kubectl apply -f -
kubectl create -f https://gist.githubusercontent.com/figaw/17dc8ed72c8d2fe1a12682beb9c1e57e/raw/e2c472cab2aa2ffb410999bcdbd158aa7617d9a3/service-account.yaml
# add Google's 8.8.8.8 dns
#kubectl get deployment --namespace=kube-system kube-dns -oyaml|sed -r 's,(.*--server)=(/ip6.arpa/.*),&\n\1=8.8.8.8,'|kubectl apply -f -
# add service account to dashboard, from https://gist.github.com/figaw/17dc8ed72c8d2fe1a12682beb9c1e57e
# this gives anyone with access to the dashboard the cluster-admin role.. so.. clearly this is for development.
)

echo ""
echo "###########################################################################################################"
echo "# k8s comfy'ness"
echo "###########################################################################################################"
echo ""
cd
yum -y install bash-completion git-core tmux vim wget sudo which openssl
source /etc/profile.d/bash_completion.sh
kubectl completion bash > /etc/bash_completion.d/kubectl.completion
source /etc/bash_completion.d/kubectl.completion
kubeadm completion bash > /etc/bash_completion.d/kubeadm.completion
source /etc/bash_completion.d/kubeadm.completion

echo ""
echo "###########################################################################################################"
echo "Install Helm"
echo "###########################################################################################################"
echo ""
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod +x ./get_helm.sh
./get_helm.sh
helm init
helm repo update
echo ""
# show kubeadm join ...
echo ""
echo "###########################################################################################################"
echo "* Join nodes with:"
kubeadm token create --print-join-command
echo "###########################################################################################################"
echo ""
# (master shouldn't join
# kubeadm join --token $(kubeadm token list |sed -n 2p|egrep -o '^\S+') $(sed -rn s,.*server:.*//,,p /etc/kubernetes/admin.conf)
echo ""