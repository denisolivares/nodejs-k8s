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

e.g: http://k8sdevPublicIP:8080

# nodejs-k8s

Plan

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

## Main references

For references reading assume **ubuntu 20.04** as OS.

https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
https://docs.docker.com/engine/install/
https://btholt.github.io/complete-intro-to-containers/making-our-own-alpine-nodejs-container
https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code