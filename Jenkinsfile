pipeline {
  agent {
    node {
      label 'instance1'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''sudo apt-get update




#sudo apt-get -y remove docker docker-engine docker.io containerd runc
#if [ $? -eq 1 ]; then
sudo apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker'''
      }
    }

    stage('error') {
      steps {
        sh '''echo "Success"






echo "Success"






echo "Success"






'''
      }
    }

  }
  environment {
    instance = 'inctance1'
  }
}