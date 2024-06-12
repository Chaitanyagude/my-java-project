pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "chaitug/my-java-project"
        KUBE_CONFIG = credentials('kubeconfig')
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    tools {
        jdk 'JDK17'  // Use the name specified in the Global Tool Configuration
        maven 'Maven3'  // Ensure you have Maven configured similarly
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Chaitanyagude/my-java-project.git'
            }
        }
        stage('Maven Build') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
                        bat 'docker push %DOCKER_IMAGE%'
                    }
                }
            }
        }
        stage('Kubernetes Deploy') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    script {
                        bat 'kubectl apply -f k8s/deployment.yaml --kubeconfig=%KUBECONFIG%'
                    }
                }
            }
        }
    }
    
}
