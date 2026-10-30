clear
sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl gpg
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
free -h
sudo apt install -y containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl status containerd
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
kubectl version --client
kubeadm version
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
free -h
sudo sysctl -w net.ipv4.ip_forward=1
cat /proc/sys/net/ipv4/ip_forward
sudo sysctl -w net.ipv4.ip_forward=1
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get nodes
kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
kubectl get pods -A
kubectl get nodes
mkdir k8s
ls
cd k8s/
nano deployment.yml
cat deployment.yml 
nano service.yml
cat service.yml 
ls
cd k8s/
ls
kubctl apply -t deployment.yml
ls
cd k8s/
ls
kubectl apply -f deployment.yml
cat deployment.yml 
nano deployment.yml 
kubectl apply -f deployment.yml
kubectl get deployment
kubectl get pods
kubectl apply -f service.yml
nano service.yml 
kubectl apply -f service.yml
kubectl get svc
kubectl describe service react-service
kubectl get pods -o wide
kubectl describe pod react-deployment-6bd8dc596b-cvwpd
kubectl describe pods
kubectl get nodes
kubectl describe pod react-deployment-6bd8dc596b-cvwpdkubectl describe pod react-deployment-6bd8dc596b-cvwpd
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
kubectl get pods -o wide
kubectl get pods -w
kubectl get pods -w
kubectl describe pod react-deployment-6bd8dc596b-cvwpd
kubectl get pods -n kube-flannel -o wide
sudo ls -la /run/flannel/
kubectl logs -n kube-flannel kube-flannel-ds-z96l8 --previous
sudo modprobe br_netfilter
lsmod | grep br_netfilter
sudo sysctl -w net.bridge.bridge-nf-call-iptables=1
sudo sysctl -w net.bridge.bridge-nf-call-ip6tables=1
sudo sysctl -w net.ipv4.ip_forward=1
echo br_netfilter | sudo tee /etc/modules-load.d/k8s.conf
sudo tee /etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system
kubectl delete pod -n kube-flannel kube-flannel-ds-z96l8
kubectl get pods -n kube-flannel -w
kubectl get pods -o wide
kubectl get svc
kubectl get endpoints react-service
kubectl get endpointslices
kubectl get endpointslice -l kubernetes.io/service-name=react-service
kubectl get svc react-service
kubectl delete -f deployment.yml
cd k8s/
kubectl delete -f deployment.yml
kubectl delete -f service.yml
kubctl get pod
kubectl get pods
kubectl get deployment
kubectl get svc
ls
cd k8s/
ls
nano deployment.yml 
cd ..
mkdir backend-k8s
nano deployment.yml
nano service.yml
nano configmap.yml
nano secret.yml
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl apply -f configmap.yml
kubectl apply -f secret.yml
kubectl get pods
kubectl describe pod backend-deployment-759b9b464b-5h5clkubectl describe pod backend-deployment-759b9b464b-5h5cl
kubectl delete pod -l app=backend-app
kubectl get pods -w
kubectl get configmap
kubectl get secret
kubectl describe deployment backend-deployment
kubectl get pods
kubectl logs backend-deployment-759b9b464b-8mbl4
kubectl get svc
kubectl get pods
kubectl get pods --show-labels
nano mysql-deployment.yml
nano mysql-service.yml
kubectl apply -f mysql-deployment.yml
kubectl apply -f mysql-service.yml
kubectl get pods
kubectl get svc
kubectl logs backend-deployment-759b9b464b-8mbl4 
kubectl rollout restart deployment backend-deployment
kubectl logs -l app=backend-app
kubectl logs backend-deployment-759b9b464b-8mbl4 
kubectl get pods
kubctl logs backend-deployment-6bf7fcdc7c-g4w2n
kubectl logs backend-deployment-6bf7fcdc7c-g4w2n
kubectl delete deployment mysql-deployment
kubectl delete service mysql
kubectl delete configmap backend-config
kubectl delete secret backend-secret
kubectl get pods
kubectl get svc
kubectl get configmap
kubectl get secret
kubectl delete deployment backend-deployment
kubectl delete service backend-servicekubectl delete deployment backend-deployment
kubectl delete service backend-service
kubectl get pods
kubectl get svc
exit
sudo kubectl get pods
sudo kubectl get pod
sudo kubectl get nods
kubectl get nodes
kubectl get pods -A
ls
cat deployment.yml 
cd backend-k8s/
ls
cls
ls
sudo grep -n "server:" /etc/kubernetes/admin.conf
sudo cp /etc/kubernetes/admin.conf /home/ubuntu/jenkins-kubeconfig
sudo chown ubuntu:ubuntu /home/ubuntu/jenkins-kubeconfig
chmod 600 /home/ubuntu/jenkins-kubeconfig
sudo openssl x509 -in /etc/kubernetes/pki/apiserver.crt -noout -ext subjectAltNamesudo openssl x509 -in /etc/kubernetes/pki/apiserver.crt -noout -ext subjectAltName
free -h
kubectl get deployments -A
kubectl get service -A
ls -l ~/.kube/config
kubectl config current-context
kubectl config view --minify
