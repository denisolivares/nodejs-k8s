#!/bin/bash

minikube start

minikube addons enable ingress

# Definir essa variável em systemas *nix para que o minikube use imagens locais do docker

eval $(minikube docker-env)

# Definir essa variável em sistemas Windows para que o minikube use imagens locais do docker
# & minikube -p minikube docker-env | Invoke-Expression

docker build -t dos/jenkins ./jenkins
docker build -t dos/njs-prod ./app-prod
docker build -t dos/njs-dev ./app-dev

# kubectl get pod -o wide

kubectl apply -f jenkins.yaml

minikube service njs-jenkins-service