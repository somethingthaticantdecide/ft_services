minikube delete
#killall -TERM kubectl minikube VBoxHeadless

minikube start --driver=docker

eval $(minikube docker-env)

docker build -t ft_test srcs/test
docker build -t ft_nginx srcs/nginx
docker build -t ft_wordpress srcs/wordpress
docker build -t ft_mysql srcs/mysql
docker build -t ft_phpmyadmin srcs/phpmyadmin
docker build -t ft_ftps srcs/ftps 
docker build -t ft_grafana srcs/grafana 
docker build -t ft_influxdb srcs/influxdb 

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl apply -f srcs/metalLB.yaml

kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/influxdb.yaml

# kubectl create secret generic -n metallb-system memberlist  --from-literal=secretkey="$(openssl rand -base64 128)"

minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable metrics-server

minikube dashboard
