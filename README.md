# ocp-mig-test-data
Ansible automation to load test-data of various sample applications to aid OCP Migration development efforts

# Usage
For backups/restores ark is required, it can be install using playbooks from this repo ```https://github.com/fusor/ocp-velero-ansible```

Export KUBECONFIG for example: ```export KUBECONFIG=~/.kube/config```

Set cluster password to env variable like this:
```export kubeadmin_password="password"```

Run ```ansible-playbook cake-php.yml``` to deploy a sample app