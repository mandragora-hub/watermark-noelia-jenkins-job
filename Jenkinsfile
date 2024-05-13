def remote = [:]
remote.name = "mandragora"
remote.host = "redania.sbs"
remote.allowAnyHosts = true

properties([parameters([text(defaultValue: '', description: 'Enter some video links to add watermark', name: 'VIDEOLIST')])])

node {
    withCredentials([sshUserPrivateKey(credentialsId: 'REDANIA_SSH', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
        remote.user = userName
        remote.identityFile = identity
        stage("Downloading script...") {
            git credentialsId: 'GITHUB_SSH', url: 'git@github.com:mandragora-hub/watermark-noelia-jenkins-job.git'
        }
        stage("SSH Steps Rocks!") {
            writeFile file: 'list.txt', text: "${params.VIDEOLIST}"
            sshPut remote: remote, from: 'list.txt', into: 'remote/dev/experiment/watermark-noelia/cli'
            
            sshScript remote: remote, script: 'script.sh'
            // sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
            // sshRemove remote: remote, path: 'abc.sh'
            // sshGet remote: remote, from: 'abc.sh', into: 'bac.sh', override: true
        }
        // stage('Retrieve files with regex') {
        //     def regexPattern = ".+\\.(log|csv)\$"
        //     sshGet remote: remote, from: '/home/jenkins/', filterRegex: regexPattern, into: 'tests/', override: true
        // }
    }
}