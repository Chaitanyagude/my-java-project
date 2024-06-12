FROM tomcat:10.1.24-jdk11-openjdk-slim
COPY target/my-java-project.war /usr/local/tomcat/webapps/
EXPOSE 8083
RUN sed -i 's/8080/8081/g' /usr/local/tomcat/conf/server.xml
CMD ["catalina.sh", "run"]
