pipeline {
    agent {
        docker {
            image 'python:3.11'
            args '-u root'
        }
    }

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/sathwik789/Docker_Project'
            }
        }

        stage('Setup Virtual Environment') {
            steps {
                sh '''
                    python -m venv $VENV_DIR
                    . $VENV_DIR/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run App') {
            steps {
                sh '''
                    . $VENV_DIR/bin/activate
                    python app/main.py
                '''
            }
        }
    }
}
