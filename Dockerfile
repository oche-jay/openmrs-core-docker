# FROM google/debian:wheezy
FROM tomcat:7.0

ENV JAVA_OPTS="-XX:PermSize=1024m -XX:MaxPermSize=512m"
ADD openmrs-runtime.properties /var/lib/tomcat7/openmrs-runtime.properties
ADD run.sh /root/run.sh

RUN apt-get update
RUN curl -L http://sourceforge.net/projects/openmrs/files/releases/OpenMRS_Platform_2.1.3/openmrs.war/download \
       -o /usr/local/tomcat/webapps/openmrs.war
RUN mkdir /var/lib/openmrs
# RUN chown tomcat7:tomcat7 /var/lib/tomcat7/openmrs-runtime.properties /var/lib/openmrs
RUN chmod +x /root/run.sh

EXPOSE 8080

CMD ["/root/run.sh"]
