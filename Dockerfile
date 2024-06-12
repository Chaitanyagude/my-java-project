FROM tomcat:10.1.24-jdk11
COPY target/my-java-project.war /usr/local/tomcat/webapps/
EXPOSE 8082
CMD ["catalina.sh", "run"]