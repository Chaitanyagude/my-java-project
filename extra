pipeline {
    agent any

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
        stage('Deploy to Tomcat') {
            steps {
                bat 'copy "target\\my-java-project.war" "C:\\apache-tomcat-10.1.24\\webapps\\"'
            }
        }
    }
}
