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
                sh'mvn validate'
            }
        }
    }
}