FROM jenkins/jenkins:2.263.1-alpine
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
COPY casc.yaml /var/jenkins_home/casc.yaml
COPY plugins /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt