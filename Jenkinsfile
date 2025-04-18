pipeline {
    agent any

    environment {
        IMAGE_NAME = "ecommerce-image"
        CONTAINER_NAME = "ecommerce-container"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Deploy (only for master)') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh '''
                        docker stop $CONTAINER_NAME || true
                        docker rm $CONTAINER_NAME || true
                        docker run -d --name $CONTAINER_NAME -p 82:80 $IMAGE_NAME
                    '''
                }
            }
        }
    }
}
