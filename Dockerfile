# FROM ubuntu:20.04
# RUN apt-get update -y
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get install apache2-utils
# RUN echo "<h1> Hello Docker</h1>" > /var/www/html/index.html
# RUN apt-get clean
# EXPOSE 80
# CMD ["apache2ctl", "-D", "FOREGROUND"]

FROM ubuntu:20.04
ENV CATALINA_HOME=/opt/apache-tomcat-9.0.97
ENV PATH=$CATALINA_HOME/bin:$PATH
RUN apt-get update
RUN apt-get install default-jdk -y 
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz /opt/
WORKDIR /opt/
RUN tar -xzf apache-tomcat-9.0.97.tar.gz
#WORKDIR /opt/apache-tomcat-9.0.97/bin/
EXPOSE 8080
CMD ["catalina.sh", "run"]
