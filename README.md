# ocp-mig-test-data
Ansible automation to load test-data of various sample applications to aid OCP Migration development efforts

# Usage

Copy config.yml.example to config.yml and set variables

Export KUBECONFIG

Set cluster password to env variable like this:
```export kubeadmin_password="password"```

Run ```ansible-playbook cake_php.yml``` to deploy a sample app

To clean after app deployment you can do ```oc delete all --selector app=cakephp-example```