## Ansible

https://www.ansible.com/how-ansible-works

https://sysadmincasts.com/episodes/43-19-minutes-with-ansible-part-1-4

https://github.com/ansible/ansible-examples/tree/master/language_features


## Practice
- Prepare a centos VM host or use a test docker host
https://github.com/runonautomation/dincd

- Run the container

- Prepare the playbook container
```
mkdir -p ansible_test
cp id_rsa ansible_test
cd ansible_test
mkdir -p playbook 
wget https://github.com/runonautomation/devops-talk/raw/master/cfgmgmt-talk-plan/samples/pb/website.zip -O playbook/pb.zip
unzip playbook/pb.zip -d ./playbook

```

- Create an ansible Dockerfile

```aidl
FROM centos:centos7
RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install git jq python-devel openssl-devel && \
    yum -y install openssh-server libffi-devel gcc python-pip && \
    yum clean all

RUN pip install ansible

COPY playbook /opt/playbook
COPY id_rsa /root/.ssh/id_rsa
```
- Build and run the container
```
docker build . -t ansible
docker run -it ansible bash
```
- Got to opt and try out the playbook
cd /opt/playbook/ansible-examples-master/lamp_simple_rhel7
- Modify the hosts file
ansible-playbook -i hosts.example site.yml
