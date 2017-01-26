
## Chef Overview 
https://docs.chef.io/chef_overview.html

### Installation
```
sudo -s
yum install wget -y 
wget https://packages.chef.io/stable/el/7/chef-server-core-12.10.0-1.el7.x86_64.rpm
rpm -ivh chef-server-core-*.rpm
```

### Initial configuration
```
chef-server-ctl reconfigure
chef-server-ctl status

chef-server-ctl user-create admin admin admin admin@globallogic.com password -f /root/.ssh/id_rsa_chef
chef-server-ctl org-create gl "GlobalLogic" --association_user admin -f /root/.ssh/gl_chef
```
- Install management console
```
chef-server-ctl install chef-manage / chef-server-ctl install opscode-manage
opscode-manage-ctl reconfigure
```
- Allow in firewall and in SG 

### Browse elements

### Setup Admin/Dev node and test
```
curl -L https://www.opscode.com/chef/install.sh | sudo bash
yum install -y git ruby
git clone git://github.com/opscode/chef-repo.git

cd chef-repo 
knife configure

knife ssl fetch

echo cookbook_path \'$(pwd)/cookbooks\' | tee -a /root/.chef/knife.rb
echo environment_path \'$(pwd)/environments\' | tee -a /root/.chef/knife.rb
```

#### Check cookbook download from internet and creation
```
knife cookbook site install nginx
knife upload cookbooks

knife cookbook create glchef
knife cookbook upload glchef
```

#### Check environments edition
```
EDITOR=vi knife environment create dev
```


### Setup Client node
```
#!/bin/bash

curl -L https://www.opscode.com/chef/install.sh | sudo bash
mkdir -p /etc/chef
cat << EOF | sudo tee /etc/chef/validation.pem
-----BEGIN RSA PRIVATE KEY-----
###
-----END RSA PRIVATE KEY-----
EOF
cat << EOF | sudo tee /etc/chef/client.rb
  log_level        :auto
  log_location     "/tmp/first-chef-client-run.log"
  chef_server_url  "https://###ADDRESS###/organizations/gl"
  validation_client_name "gl-validator"
  node_name "testnode1"
  environment "dev"
  ssl_verify_mode :verify_none
EOF
chef-client --runlist glchef
```