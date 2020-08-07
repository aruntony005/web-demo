#!/user/bin/env groovy
import hudson.model.*

def JENKINS_USER="demo"
node('master') {
    stage("test") {
         sh """#!/bin/bash -e\n
            git clone https://github.com/aruntony005/web-demo.git
            ls -a
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
