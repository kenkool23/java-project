pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git 'https://github.com/kenkool23/java-project.git'
            }
        }
        stage('Build') {
            steps {
                sh 'cd MyWebApp && mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'cd MyWebApp mvn test'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://34.227.56.60:8080/')], contextPath: 'path', war: '**/*.war'
            }
        }
    }
}
