FROM picoded/ubuntu-openjdk-8-jdk
RUN apt-get update
RUN apt-get install -y git maven tomcat8
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR target/
RUN cp hello-1.0.war /var/lib/tomcat8/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
