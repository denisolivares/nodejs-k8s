FROM jenkins/jenkins:2.263.1-alpine
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY plugins /usr/share/jenkins/ref/plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins