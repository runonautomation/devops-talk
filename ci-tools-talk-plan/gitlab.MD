## Overview

## Action log
### Installation options
- https://about.gitlab.com/installation/
#### Docker based installation
```$xslt

ifconfig
echo enter the needed IP:
read IP


mkdir -p gitlab
workdir=$(pwd)/gitlab
wget https://raw.githubusercontent.com/sameersbn/docker-gitlab/master/docker-compose.yml
sed  "s|/srv/docker/gitlab|${workdir}|g" docker-compose.yml | tee compose_with_path
sed  "s|GITLAB_HOST=localhost|GITLAB_HOST=$IP|g" compose_with_path | tee compose_with_path_and_ip
mv docker-compose.yml docker-compose.yml_old
cp compose_with_path_and_ip docker-compose.yml

docker-compose up

# Testing and building:
docker run -it ubuntu:latest bash
# Inside container: 
apt update
apt install -y wget curl git nodejs
wget -O /usr/local/bin/gitlab-ci-multi-runner https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64
chmod +x /usr/local/bin/gitlab-ci-multi-runner
gitlab-ci-multi-runner install --service  gitlab-runner --user root
gitlab-ci-multi-runner register 



```
### Users management and authentication

### Project structure and settings

### Slave nodes approaches 
##### Shell executor vs docker
##### Reproducilble building 

## Materials
https://docs.gitlab.com/ce/intro/README.html
https://docs.gitlab.com/ce/ci/quick_start/

