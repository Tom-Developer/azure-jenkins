FROM        jenkins/jenkins:2.249.3-lts AS default

ARG         VERSION=0.2

LABEL       maintainer="tom p."

ENV         JAVA_OPTS="-Duser.timezone=America/Montreal"
ENV         JENKINS_OPTS --sessionTimeout=360

WORKDIR		/var/jenkins_home

USER        root

# test what commands are available
#RUN         set -x                                                   &&\
#login to jenkins as admin ???                                         \
#            echo $PATH                                               &&\
#            java -version                                           &&\
#			 curl -V | head -n 1 | cut -d' ' -f1,2 			

# install useful apps and infrastructure for smee-client and smee-client
RUN         apt-get update                                          &&\
            apt-get install -y vim less                             &&\
            curl -sL https://deb.nodesource.com/setup_10.x | bash - &&\
            apt-get install -y nodejs                               &&\
            nodejs -v                                               &&\
            npm -v                                                  &&\
            npm install --global smee-client                        &&\
            smee -v


# allow this port number to connect to Jenkins in this container
EXPOSE      8080

USER        jenkins

ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

