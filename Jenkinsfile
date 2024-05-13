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
            sshPut remote: remote, from: 'list.txt', into: 'remote/dev/experiment/watermark-noelia/tiktok-downloader/cli/list.txt'
            
            sshScript remote: remote, script: 'script.sh'
            // sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
            // sshRemove remote: remote, path: 'abc.sh'
            // sshGet remote: remote, from: 'abc.sh', into: 'bac.sh', override: true
        }
        
        stage('Retrieve files with regex') {
            def regexPattern = ".+\\.(mp4)\$"
            sshGet remote: remote, from: '/home/mandragora/remote/dev/experiment/watermark-noelia/output/', filterRegex: regexPattern, into: '.', override: true
        }

        stage('Clean files') {
            // sshScript remote: remote, script: 'clean.sh'
        }
    }
}