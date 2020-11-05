FROM        jenkins/jenkins:lts

ARG         VERSION=LTS

LABEL       version=0.1
LABEL       maintainer="tom p."


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

