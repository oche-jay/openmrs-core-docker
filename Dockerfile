# FROM google/debian:wheezy
FROM tomcat:7-jre8

ENV JAVA_OPTS="-XX:PermSize=1024m -XX:MaxPermSize=512m"
RUN apt-get update
RUN curl -L http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.2.0/openmrs.war/download \
       -o /usr/local/tomcat/webapps/openmrs.war
RUN curl -L https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Reference_Application_2.9.0/referenceapplication-addons-2.9.0.zip/download -o openmrs-addons.zip
RUN mkdir ~/.OpenMRS
RUN unzip openmrs-addons.zip
RUN mv referenceapplication-package-2.9.0/* ~/.OpenMRS
VOLUME ~/.OpenMRS
RUN mkdir /usr/local/lib/openmrs
#ADD openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties
VOLUME /usr/local
RUN rm openmrs-addons.zip
RUN rm -rf referenceapplication-package-2.9.0

EXPOSE 8080

