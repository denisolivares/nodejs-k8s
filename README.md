# Running the project

## First:

AWS Credentials configured

https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html

Terraform installed

https://learn.hashicorp.com/tutorials/terraform/install-cli

## Then:

- 1 - Clone this repo
- 2 - Run ```terraform init```
- 3 - Then run ```terraform plan``` and check the results
- 4 - run ```terraform apply```
- 5 - terraform will output the Control Plane Endopoint IP

# Jenkins Access
Open you favorite browser, copy & paste the Control Plane Endpoint public IP address + port 8080.

e.g: http://< k8sdevPublicIP >:8080

# nodejs-k8s
   - [ ] Create a minimalistic local Kubernetes environment
   - [ ] running a NodeJS application
   - [ ] that connects to a database
   - [ ] retrieves the "Hello World" string from it
   - [ ] and returns it as a reply to an HTTP request
   - [ ] There should be two infrastructure environments, Dev and Prod.

## Plan
   - [x] Spin up 02 AWS instances using Terraform
      - [x] Install docker
      - [ ] Install k8s
      - [x] Create Jenkins container/pod
      - [x] Setup Jenkins
   - [ ] Configure Jenkins pipeline
   - [ ] Create app container
      - [ ] App consulting DB
   - [x] Install Helm
      - [ ] Configure Helm
   - [ ] Setup DEV environment
   - [ ] Setup PROD environment

## Plan 2

### Requirements
   - [ ] All resources should be managed in your code
   - [ ] NO pre-existing images (like the images publicly available from DockerHub)
   - [ ] Publicly-available images are allowed to be used for the underlying “infrastructure” pieces, like DB or the CI tool.
   - [ ] Dev and Prod environments must be configured using a template tool (e.g. HELM, Kustomize, jsonnet, etc.)
      - [ ] HELM selected

### Tools
   - [ ] Cluster management: Minikube
   - [ ] Deployable artifact: Docker image created from the provided Dockerfile
   - [ ] Deployment method: Kubernetes YAML files / HELM
   - [ ] Infrastructure environment templating: HELM / Kustomize / jsonnet.
   - [ ] CI/CD: GitlabCI / Jenkins pipeline (can be run as a separate pod on the Minikube "cluster").
      - [ ] Jenkins selected
   - [ ] Scripting language: Bash, Python, Ruby or Go

### Deliverables
   - [ ] A link to a publicly available git repo with
      - [ ] Dockerfile (one or several, depending on your design) containing the build of a deployable artifact, like a Docker image with an application inside.
      - [ ] Kubernetes manifests / HELM charts to deploy this app to a Kubernetes cluster.
      - [ ] GitlabCI/Jenkins/Drone pipeline which streamlines the process of building and deploying (nice to have).
      - [ ] Create README.md with step-by-step instructions on how to get from cloning your public repo to opening your hello-world application running in Minikube in a web browser and seeing the "Hello World" phrase (no need for a fancy web page, a line of text is sufficient).

## Main references

For references reading assume **ubuntu 20.04** as OS.

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
https://docs.docker.com/engine/install/
https://btholt.github.io/complete-intro-to-containers/making-our-own-alpine-nodejs-container
https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code