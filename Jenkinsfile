pipeline {
  agent {
    node {
      label 'instance1'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'echo "HEllo"'
      }
    }

  }
  environment {
    instance = 'inctance1'
  }
}