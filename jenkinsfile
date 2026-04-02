pipeline {
    agent any

    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                pwd
                ls -larth
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd myapp
                python3 hello.py
                python3 hello.py --name=Chetan Sharma
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}

// pipeline {
//     agent any

//     triggers {
//         pollSCM '* * * * *'
//     }

//     stages {
//         stage('Build') {
//             steps {
//                 echo "Building.."
//                 sh '''
//                 . /var/jenkins_home/workspace/my-python-job/myapp/path/to/venv./bin/activate
//                 pip install -r /var/jenkins_home/workspace/my-python-job/myapp/requirements.txt                                 # install dependencies
//                 '''
//             }
//         }

//         stage('Test') {
//             steps {
//                 echo "Testing.."
//                 sh '''
//                 . /var/jenkins_home/workspace/my-python-job/myapp/path/to/venv./bin/activate              # activate the same venv
//                 python3 /var/jenkins_home/workspace/my-python-job/helloworld.py
//                 python3 /var/jenkins_home/workspace/my-python-job/helloworld.py --name="Chetan Sharma"
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
