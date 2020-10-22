FROM        jenkins/jenkins:lts as installation
ENTRYPOINT  ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
