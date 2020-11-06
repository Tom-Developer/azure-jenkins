FROM        jenkins/jenkins:2.249.3-lts AS default

ARG         VERSION=lts

LABEL       version=0.2
LABEL       maintainer="tom p."

ENV         JAVA_OPTS="-Duser.timezone=America/Montreal"
ENV         JENKINS_OPTS --sessionTimeout=360


# test what commands are available
#RUN         set -x                                                   &&\
#login to jenkins as admin ???                                         \
#            echo $PATH                                               &&\
#            java -version                                           &&\
#			 curl -V | head -n 1 | cut -d' ' -f1,2 			

WORKDIR		/mnt/temp1/docker-data

# allow this port number to connect to Jenkins in this container
EXPOSE      8080

USER        jenkins

ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

