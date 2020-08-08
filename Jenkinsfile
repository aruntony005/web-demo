#!/user/bin/env groovy
import hudson.model.*

def JENKINS_USER="demo"
node('master') {
    stage("git checkout stage") {
         sh """#!/bin/bash -e\n
            git clone https://github.com/aruntony005/web-demo.git
            ls -a
         """
    }
    stage("kubernetes image build and deployment stage") {
        sh """#!/bin/bash -e\n
            sudo kubectl get all
            chmod 755 web-demo/shell.sh
            sudo sh ${workspace}/web-demo/shell.sh
            rm -rf *
         """
         println "${workspace}"
         def pwd= "${workspace}"
         deleteDir()
    }
}
