minikube start
minikube addons enable metallb
kubectl apply -f config.yaml

eval $(minikube docker-env)
docker build -t wordpress .

kubectl apply -f wordpress.yaml
kubectl apply -f wordpress-svc.yaml