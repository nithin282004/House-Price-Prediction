pipeline {
    agent any

    environment {
        IMAGE_NAME = "house-price-app"
        CONTAINER_NAME = "house-price-container"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nithin282004/House-Price-Prediction'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                script {
                    bat """
                    docker stop ${CONTAINER_NAME} || echo "No container to stop"
                    docker rm ${CONTAINER_NAME} || echo "No container to remove"
                    """
                }
            }
        }

        stage('Run App with Docker Compose') {
            steps {
                script {
                    bat "docker-compose up -d"
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Build or deployment failed!'
        }
        success {
            echo '✅ App deployed successfully.'
        }
    }
}
