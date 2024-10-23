pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/deveshksh/daylight.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t daylight .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm daylight npm test'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                docker stop daylight-app || true
                docker rm daylight-app || true
                docker run -d -p 3000:3000 --name daylight-app daylight
                '''
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
