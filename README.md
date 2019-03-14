# ocp-mig-test-data [![Build Status](https://travis-ci.com/fusor/ocp-mig-test-data.svg?branch=master)](https://travis-ci.com/fusor/ocp-mig-test-data)
Ansible automation to load test-data of various sample applications to aid OCP Migration development efforts.

# Usage
Velero is required for backups/restores, it can be installed using playbooks from this repo ```https://github.com/fusor/ocp-velero-ansible```

Export KUBECONFIG for example: ```export KUBECONFIG=~/.kube/config```

Set cluster password to env variable like this:
```export kubeadmin_password="password"```

Run ```ansible-playbook cake-php.yml``` to deploy, backup and restore a sample app.

It's also possible to optionally run backup/restore: ```ansible-playbook cake-php.yml -e with_backup=false -e with_restore=false```

Loging in to cluster can be enabled by setting PROMPT_LOGIN: ```export PROMPT_LOGIN=true```

# Test cases info

We need to keep track of supported and unsupported test cases.

* Tests cases that are expected to succeed:

  - Basic app example -  ```nginx```
  - Pod - ```pod```
  - Image Stream - ```mysql-centos7-is```
  - RBAC - ```basic-sa-with-role```
  - Route - ```route```
  - CRD - ```crd```
  - Service - ```service```
  - NetworkPolicy - ```net-policy``` - prerequisites needed
  - Pipeline - ```pipeline```
  - Security Context Constraints - ```scc```
  - Replica set - ```sets```
  - Config map - ```config```
  
* Tests cases that are expected to fail:

  - S2I - ```cakephp```
  - PVC - ```mysql-pvc```

* Test cases prerequisites

  - NetworkPolicy - ```net-policy\net-policy-extended```
    - OCP-3: ```networkPluginName: redhat/openshift-ovs-networkpolicy``` should be specified in `/etc/origin/master/master-config.yaml`, or better create new cluster under upshift with `openshift` bundle and `os_sdn_network_plugin_name` set to `ovs-networkpolicy`.
    - OCP-4: comes with default `Networkpolicy` plugin, but for editing use `oc edit networkconfig` and configure as stated in the example https://github.com/openshift/cluster-network-operator#configuring-openshiftsdn

  - RBAC 
    - ```rbac-user-roles``` For running this playbook with user creation run ```export RBAC_PREREQ=true```
