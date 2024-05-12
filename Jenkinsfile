def remote = [:]
remote.name = "mandragora"
remote.host = "redania.sbs"
remote.allowAnyHosts = true

node {
    withCredentials([sshUserPrivateKey(credentialsId: 'REDANIA_SSH', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'mandragora')]) {
        remote.user = "userName"
        remote.identityFile = "identity"
        stage("SSH Steps Rocks!") {
            writeFile file: 'abc.sh', text: 'ls'
            sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
            // sshPut remote: remote, from: 'abc.sh', into: '.'
            sshScript remote: remote, script: 'abc.sh'
            // sshRemove remote: remote, path: 'abc.sh'
            // sshGet remote: remote, from: 'abc.sh', into: 'bac.sh', override: true
        }
    }
}