node ('client1') {
    stage('Clone') {
        git 'https://github.com/mili1211/projeta.git'
    }
    stage('Ansible') {
        writeFile file: '.vaultpass_file', text: env.vault_password
        ansiblePlaybook (
            become: true,
            inventory: 'hosts.yml',
            playbook: 'playbook.yml',
            extras: "--vault-pass-file .vaultpass_file"
        )
    }
}
