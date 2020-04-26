#!/bin/bash
sudo yum -y update
sudo yum -y install https://as-repository.openvpn.net/as-repo-centos7.rpm
sudo yum -y install openvpn-as
sudo systemctl enable openvpnas
sudo systemctl start openvpnas
sudo service openvpnas status
echo "@superSecured69" | sudo passwd --stdin openvpn