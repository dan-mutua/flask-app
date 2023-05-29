pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('mutua-dockerhub')
        KUBECONFIG = credentials('kubeconfig')
        KUBE_NAMESPACE = 'flask-app'
        KUBE_DEPLOYMENT_NAME = 'flask-app'
    }
    stages {
        stage('Build docker image') {
            steps {
                sh 'docker build -t themutua/flask-app:$BUILD_NUMBER .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps {
                sh 'docker push themutua/flask-app:$BUILD_NUMBER'
            }
        }
        stage('Deploy to Kubernetes') {
              stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
                sh 'ansible-playbook configure_ec2.yml'
            }
        }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
