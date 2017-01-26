## Overview

## Action log
### Installation options
#### Usage packaged version from your distro repository
```$xslt
sudo yum -y install java
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
sudo systemctl start jenkins.service
sudo systemctl status jenkins.service

```
#### war installation with custom service definition
```$xslt
sudo yum -y install java
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
java -jar jenkins.war

sudo cp jenkins.war /usr/local/bin/jenkins.war

```
Create a service definition in /etc/systemd/system/jenkins.service:
```$xslt
[Unit]
Description=Jenkins Service
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/java -jar /usr/local/bin/jenkins.war
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

```$xslt
sudo systemctl daemon-reload
sudo systemctl start jenkins.service
```
#### Docker based installation
```$xslt
mkdir jenkins
workdir=$(pwd)/jenkins
docker run -p 8080:8080 -p 50000:50000 -v $workdir:/var/jenkins_home jenkins
```

### Basic usage: FreeStyle Project

### Slave nodes approaches 
#### SSH remote launch
#### AS JAR
### Slaves: reproducible and tagged

### Users management and authentication
### Installing Plugins && Plugins overview: https://plugins.jenkins.io/
### Credentials manager
## Core Plugins Overview

## Best practices
### Always use authentication
### Jobs parametrization
### Configuration as code
#### Job DSL
#### Pipelines
https://jenkins.io/doc/pipeline/examples/
https://www.cloudbees.com/blog/top-10-best-practices-jenkins-pipeline-plugin
Check the example pipeline
### Blue Ocean

### Artifacts storage externalized
### Use for recurrent infrastructure tasks

## Materials and news
- http://www.slideshare.net/andrewbayer/seven-habits-of-highly-effective-jenkins-users-2014-edition
- Blue Ocean https://jenkins.io/blog/2016/05/26/introducing-blue-ocean/