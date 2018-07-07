# FROM google/debian:wheezy
FROM tomcat:7-jre8

ENV JAVA_OPTS="-XX:PermSize=512m -XX:MaxPermSize=256m"
RUN apt-get update
RUN curl -L http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.1.3/openmrs.war/download \
       -o /usr/local/tomcat/webapps/openmrs.war
RUN curl -L https://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Reference_Application_2.8.0/referenceapplication-addons-2.8.0.zip/download -o openmrs-addons.zip
RUN mkdir /opt/openmrs
RUN unzip openmrs-addons.zip -d /opt/openmrs
RUN mkdir /usr/local/lib/openmrs
ADD openmrs-runtime.properties /usr/local/tomcat/openmrs-runtime.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]
