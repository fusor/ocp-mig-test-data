#!/bin/bash

function prepare() {
  wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
  tar -zvxf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
  cd openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit
  sudo cp oc /usr/local/bin
  cd ../
}

bring_up_cluster() {
  ip addr show eth0
  export HOST_IP_ADDRESS="$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)"
  echo "Host IP is $HOST_IP_ADDRESS"
  IMAGEFOROC="quay.io/openshift/origin-cli:v3.11"
  sudo docker cp $(docker create $IMAGEFOROC):/bin/oc /usr/local/bin/oc
  echo "Starting cluster"
  oc cluster up --public-hostname=$HOST_IP_ADDRESS
}

function install_velero() {
  echo "Installing velero"
  oc login -u system:admin
  git clone https://github.com/fusor/ocp-velero-ansible/
  cd ocp-velero-ansible/
  mkdir auth
  cat $HOME/.kube/config > auth/kubeconfig
  grep -v "login_ocp" launch-ark.yml > temp && mv temp launch-ark.yml
  echo "Launching velero"
  ansible-playbook launch-ark.yml
}

prepare
bring_up_cluster
install_velero
