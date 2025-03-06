pipeline{
    agent any 

    tools{
        maven 'MAVENHOME_3.9.9'
    }
    stages{
        stage('SCM') {
            steps{
                git url:'https://github.com/sadikshai/spring-petclinic.git',
                branch: 'main'
            }


        }
        stage('BUILD'){
            steps{
                sh'mvn clean package'
            }
        }
        

    post {
        success {
            junit 'target/surefire-reports/*.xml' 
            archiveArtifacts artifacts: '**/*.jar'
        }
        failure {
            echo 'Build failed. Check logs for errors.'
        }
    }
}
}
