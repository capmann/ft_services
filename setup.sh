minikube delete
minikube start
minikube addons enable metallb
kubectl delete configmap config -n metallb-system
kubectl apply -f ./wordpress/config.yaml

eval $(minikube docker-env)
docker build -t nginx ./nginx/
docker build -t wordpress ./wordpress/
docker build -t mysql ./mysql/
#docker build -t phpmyadmin ./phpmyadmin/

kubectl apply -f ./nginx/nginx_deployment.yaml
kubectl apply -f ./nginx/nginx_service.yaml
kubectl apply -f ./wordpress/wordpress.yaml
kubectl apply -f ./wordpress/wordpress_svc.yaml
kubectl apply -f ./mysql/pvc.yaml
kubectl apply -f ./mysql/mysql_deployment.yaml
kubectl apply -f ./mysql/mysql_service.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin_deployment.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin_service.yaml
