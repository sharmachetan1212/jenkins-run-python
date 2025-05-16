// pipeline {
//     agent { 
//         node {
//             label 'docker-agent-python'
//             }
//       }
//     triggers {
//         pollSCM '* * * * *'
//     }
//     stages {
//         stage('Build') {
//             steps {
//                 echo "Building.."
//                 sh '''
//                 cd myapp
//                 pip install -r requirements.txt
//                 '''
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo "Testing.."
//                 sh '''
//                 cd myapp
//                 python3 hello.py
//                 python3 hello.py --name=Brad
//                 '''
//             }
//         }
//         stage('Deliver') {
//             steps {
//                 echo 'Deliver....'
//                 sh '''
//                 echo "doing delivery stuff.."
//                 '''
//             }
//         }
//     }
// }

pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')  // Polls SCM every minute
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                bat '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                bat '''
                cd myapp
                python hello.py
                python hello.py --name=Brad
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                bat '''
                echo Doing delivery stuff...
                '''
            }
        }
    }
}
