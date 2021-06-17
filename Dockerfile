FROM tomcat:latest
COPY MyWebApp/target/MyWebApp /usr/local/tomcat/webapps
EXPOSE 8080 

