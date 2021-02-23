minikube delete
minikube start
minikube addons enable metallb
kubectl delete configmap config -n metallb-system
kubectl apply -f config.yaml

eval $(minikube docker-env)
docker build -t wordpress .

kubectl apply -f wordpress.yaml
kubectl apply -f wordpress-svc.yaml
