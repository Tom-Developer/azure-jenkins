FROM        jenkins/jenkins:2.249.3-lts AS default

ENV         JAVA_OPTS="-Duser.timezone=America/Montreal"
ENV         JENKINS_OPTS --sessionTimeout=360

ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
