# ocp-mig-test-data
Ansible automation to load test-data of various sample applications to aid OCP Migration development efforts.

# Usage
Velero is required for backups/restores, it can be installed using playbooks from this repo ```https://github.com/fusor/ocp-velero-ansible```

Export KUBECONFIG for example: ```export KUBECONFIG=~/.kube/config```

Set cluster password to env variable like this:
```export kubeadmin_password="password"```

Run ```ansible-playbook cake-php.yml``` to deploy, backup and restore a sample app.

# Test cases info

We need to keep track of supported and unsupported test cases.

* Tests cases that are expected to succeed:

  - Basic app example -  ```nginx```
  - Pod - ```pod```

* Tests cases that are expected to fail:

  - S2I - ```cakephp```
  - PVC - ```mysql-pvc```
