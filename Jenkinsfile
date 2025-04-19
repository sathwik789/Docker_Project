pipeline {
    agent {
        docker {
            image 'python:3.11'
            args '-u root'  // Running as root, but ensure this is necessary for your use case
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

        stage('Setup Virtual Environment and Install Dependencies') {
            steps {
                sh '''
                    # Set up virtual environment
                    python -m venv $VENV_DIR
                    . $VENV_DIR/bin/activate

                    # Install dependencies
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run App') {
            steps {
                sh '''
                    # Activate virtual environment and run the app
                    . $VENV_DIR/bin/activate
                    python app/main.py
                '''
            }
        }
    }
}
