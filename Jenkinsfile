pipeline {
    agent any

    environment {
        FLASK_APP = "app.py"
        VENV_DIR = "venv"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/sathwik789/Docker_Project'
            }
        }

        stage('Setup Virtual Environment') {
            steps {
                sh 'python3 -m venv $VENV_DIR'
                sh './$VENV_DIR/bin/pip install --upgrade pip'
                sh './$VENV_DIR/bin/pip install -r requirements.txt'
            }
        }

        stage('Run App') {
            steps {
                sh './$VENV_DIR/bin/python app.py &'
                sleep time: 10, unit: 'SECONDS'
            }
        }
    }
}
