pipeline {
    agent any

    environment {
        // Optional: define Python path or virtualenv if needed
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
                // You can create a virtual environment (optional)
                sh '''
                    python -m venv venv
                    source venv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run House Price Script') {
            steps {
                sh '''
                    source venv/bin/activate
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
