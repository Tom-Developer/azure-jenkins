FROM        jenkins/jenkins:lts as installation
#ARG        VERSION=LTS
#ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

FROM        scratch
#USER       root
LABEL       version="0.1"
LABEL       maintainer="tom"

# copy 'build' image to current one
COPY        --from=installation / /

#VOLUME
#WORKDIR

RUN         set -x                                                  &&\
#login to jenkins as admin                                            \
            echo $PATH                                               &&\
            echo "hello world"        



# allow this port number to connect to Jenkins in this container
EXPOSE      8080
#EXPOSE      50000

USER       jenkins

ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
