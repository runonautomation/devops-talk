FROM centos:7

RUN yum clean all && \
    yum update -y && \
    yum install -y git && \
    yum install -y wget && \
    yum install -y rsync && \
    yum install -y openssh-server && \
    /usr/bin/ssh-keygen -A &&\
    yum install -y java-1.8.0-openjdk && \
    yum install -y sudo && \
    yum clean all &&\
    useradd jenkins -m -s /bin/bash &&\
    echo 'jenkins:jenkinss' |chpasswd &&\
    echo "jenkins  ALL=(ALL)  ALL" >> /etc/sudoers
fdd
CMD ["/usr/sbin/sshd","-D"]