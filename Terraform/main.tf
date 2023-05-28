provider "aws" {
  region = "us-east-1"
}




resource "aws_instance" "flask-app" {
  ami              = "ami-053b0d53c279acc90" # Replace with the desired AMI ID
  instance_type    = "t2.medium"
  security_groups = ["launch-wizard-4"]  # Replace with the name of your security group 
  key_name         = "mrl" # Replace with the name of your EC2 key pa
  
  root_block_device {
    volume_size = 40
  }
  
  monitoring = true

  user_data = <<-EOF
    #!/bin/bash

    # Install Docker
    sudo apt-get update
    sudo apt-get install -y docker.io

    # Install Minikube dependencies
    sudo apt-get install -y curl
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube

    # Start Minikube
    sudo minikube start --driver=docker --kubernetes-version=stable

    # Set up kubectl
    sudo apt-get install -y kubectl

    # Enable addons (optional)
    sudo minikube addons enable ingress

    # Set up kubeconfig for the current user
    mkdir -p $HOME/.kube
    sudo cp -i /root/.kube/config $HOME/.kube/
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

   
  EOF
}
