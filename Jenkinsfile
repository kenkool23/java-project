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

       stage ('Code Quality scan')  {
           steps{
       withSonarQubeEnv('new-sonar') {
       sh "mvn -f MyWebApp/pom.xml sonar:sonar"
            }
        }
       }

        stage ('Artifactory configuration') {

            steps {

                rtServer (

                    id: "jfrog",

                    url: "http://18.204.13.52:8082//artifactory",

                    credentialsId: "jfrog-art",
                    bypassProxy: true

                )
            }
        }

        stage('Deploy Artifacts') {
            steps {
                rtUpload (
                    serverId: 'jfrog'
            )
        }
    }

        stage("Quality gate") {
            steps {
                waitForQualityGate abortPipeline: true
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://34.227.56.60:8080/')], contextPath: 'path', war: '**/*.war'
            }
        }
    }
}

