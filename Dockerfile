FROM tomcat:10.1.24-jdk11
COPY target/my-java-project.war /usr/local/tomcat/webapps/
EXPOSE 8083
CMD ["catalina.sh", "run"]