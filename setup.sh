#!/bin//sh

if [ "$1" = "vm_setup" ];
then bash vm_setup.sh
fi

minikube delete
minikube start --driver=docker
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
kubectl delete configmap config -n metallb-system
kubectl apply -f ./wordpress/config.yaml

eval $(minikube docker-env)
docker build -t nginx ./nginx/ 
docker build -t wordpress ./wordpress/ 
docker build -t mysql ./mysql/ 
docker build -t phpmyadmin ./phpmyadmin/
docker build -t ftps ./ftps/
docker build -t grafana ./grafana/
docker build -t influxdb ./influxdb/
docker build -t telegraf ./telegraf/

kubectl apply -f ./nginx/nginx_deployment.yaml
kubectl apply -f ./nginx/nginx_service.yaml 
kubectl apply -f ./mysql/pvc.yaml 
kubectl apply -f ./mysql/mysql_deployment.yaml
kubectl apply -f ./mysql/mysql_service.yaml
kubectl apply -f ./wordpress/wordpress.yaml
kubectl apply -f ./wordpress/wordpress_svc.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin_deployment.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin_service.yaml
kubectl apply -f ./ftps/ftps_deployment.yaml
kubectl apply -f ./ftps/ftps_service.yaml
kubectl apply -f ./influxdb/pvc.yaml
kubectl apply -f ./influxdb/influxdb_deployment.yaml
kubectl apply -f ./influxdb/influxdb_service.yaml
kubectl apply -f ./grafana/grafana_deployment.yaml
kubectl apply -f ./grafana/grafana_service.yaml
kubectl apply -f ./telegraf/telegraf-secret.yaml
kubectl apply -f ./telegraf/telegraf-config.yaml
kubectl apply -f ./telegraf/telegraf_deployment.yaml
kubectl apply -f ./telegraf/telegraf_service.yaml
