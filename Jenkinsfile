pipeline {
    agent any

    environment {
        PYTHONUNBUFFERED = '1'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/nithinaparadapu/house-price-prediction.git'
            }
        }

        stage('Set Up Python Environment') {
            steps {
                bat '''
                    python -m venv venv
                    call venv\\Scripts\\activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run House Price Script') {
            steps {
                bat '''
                    call venv\\Scripts\\activate
                    python house_price_model.py
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check the console output for details.'
        }
    }
}
