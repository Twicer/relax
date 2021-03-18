pipeline {
  agent {
    node {
      label 'instance1'
    }

  }
  stages {
    stage('Build') {
      parallel {
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
            sh '''cat > Dockerfile << EOF
FROM python:3.5.10-slim

COPY . .
EXPOSE 80
CMD python3 -m http.server 80
EOF'''
          }
        }

        stage('ls') {
          steps {
            sh 'ls .'
          }
        }

      }
    }

    stage('Docker Build') {
      steps {
        sh '''sudo docker build -t relaxnote .
sudo docker images
'''
      }
    }

    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            sh '''#sudo docker run -d --restart=always -p 80:80 alexey/relaxnote
sudo docker run -d  --restart=always --network host --name web relaxnote'''
          }
        }

        stage('ConnectionTest') {
          steps {
            sh '''


export MYIP=$(curl ifconfig.me)
echo $MYIP
curl $MYIP
ss -tulpn
'''
          }
        }

      }
    }

  }
  environment {
    instance = 'inctance1'
  }
}