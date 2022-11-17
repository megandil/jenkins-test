FROM registry.redhat.io/openshift4/ose-jenkins:v4.10.0-202210211005.p0.g421f1f9.assembly.stream

ARG JENKINS_VER="2.361.1"


USER root
WORKDIR /usr/lib/jenkins/
RUN ls -lst jenkins.war \
  && rm -f jenkins.war \
  && wget --quiet https://updates.jenkins.io/download/war/${JENKINS_VER}/jenkins.war \
  && ls -lst jenkins.war
  
 USER 1001
 ENTRYPOINT ["/usr/bin/go-init", "-main", "/usr/libexec/s2i/run"]
