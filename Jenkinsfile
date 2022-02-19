node {
    stage('git checkout'){
        git 'https://github.com/KartikeyaReddy24/github.git'
    }
    stage('Docker build image'){
        sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID . '
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID kartikeya24/$JOB_NAME:v1.$BUILD_ID'
        sh 'docker image tag $JOB_NAME:v1.$BUILD_ID kartikeya24/$JOB_NAME:latest'
    }
    stage('pushing images to dockerHub'){
        
      withCredentials([string(credentialsId: 'MLA', variable: 'hot')]) {
         sh "docker login -u kartikeya24 -p ${hot}"
         sh 'docker image push kartikeya24/$JOB_NAME:v1.$BUILD_ID'
         sh 'docker image push kartikeya24/$JOB_NAME:latest'
         
         sh 'docker image rmi $JOB_NAME:v1.$BUILD_ID kartikeya24/$JOB_NAME:v1.$BUILD_ID kartikeya24/$JOB_NAME:latest'
          
         }
    }
    stage('Docker Container Deployment'){
        
        def docker_rmv_cont = 'docker rm -f from_jenkins'
        def docker_rmi= 'docker rmi -f kartikeya24/docker-groovy-webapp'
        def docker_run = 'docker run -it -d --name from_jenkins -p 9000:80 kartikeya24/docker-groovy-webapp'
        
        sshagent(['Webapp_server']) {
            
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.95.30 ${docker_rmv_cont}"
            
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.95.30 ${docker_rmi}"
            
            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.95.30 ${docker_run}"
            
         }   
    }
}