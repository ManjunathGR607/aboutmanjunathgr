node {
        stage("Git Clone"){

        git credentialsId: 'Git-Hub-Credentials', url: 'https://github.com/ManjunathGR607/aboutmanjunathgr.git'
    
        stage("Docker build"){
            sh 'docker version'
            sh 'docker build --no-cache -t manjunathgr .'
            sh 'docker tag manjunathgr manjunathgr/aboutmanjunathgr:$BUILD_NUMBER'
        }

        withCredentials([string(credentialsId: 'Docker-Hub-Password', variable: 'PASSWORD')]) {
            sh 'docker login -u manjunathgr -p $PASSWORD'
        }

        stage("Push Image to Docker Hub"){
            sh 'docker push  manjunathgr/aboutmanjunathgr:$BUILD_NUMBER'
        }
        
        stage("kubernetes deployment"){
            sh 'sed -i "s/_BUILD_NUMBER_/${BUILD_NUMBER}/" deploymentservice.yaml'
            sh 'kubectl apply -f deploymentservice.yaml'
        }
        stage('CleanUp workspace') {
            sh ' echo CleanUp'
            sh "docker rmi manjunathgr/aboutmanjunathgr:${BUILD_NUMBER}"
            sh "docker rmi manjunathgr"
        }
    }
}
