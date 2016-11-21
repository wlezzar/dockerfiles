# Build : docker build -t wlezzar/sqlworkbench:121 .
# Run : docker run -it --rm --name sqlworkbench \
#       -v /tmp/.X11-unix:/tmp/.X11-unix \
#       -e DISPLAY=unix$DISPLAY \
#       -e USER_NAME=$(id -un) \
#       -v /etc/passwd:/etc/passwd:ro \
#       -v /etc/group:/etc/group:ro \
#       wlezzar/sqlworkbench:121

FROM wlezzar/java:8

ENV SQL_WORKBENCH_BUILD_VERSION=121.2 SQL_WORKBENCH_HOME=/opt/sqlworkbench

# Install SQL Workbench
RUN wget -O /tmp/Workbench-Build.zip http://www.sql-workbench.net/Workbench-Build${SQL_WORKBENCH_BUILD_VERSION}.zip && \
    mkdir -p $SQL_WORKBENCH_HOME && \
    unzip -d $SQL_WORKBENCH_HOME /tmp/Workbench-Build.zip && \
    chmod +x $SQL_WORKBENCH_HOME/sqlworkbench.sh && \
    rm $SQL_WORKBENCH_HOME/*.pdf $SQL_WORKBENCH_HOME/*.exe

# Install custom jars
RUN mkdir $SQL_WORKBENCH_HOME/drivers && \
    wget -O $SQL_WORKBENCH_HOME/drivers/postgresql.jar https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar && \
    wget -O $SQL_WORKBENCH_HOME/drivers/mysql.jar http://central.maven.org/maven2/mysql/mysql-connector-java/6.0.5/mysql-connector-java-6.0.5.jar && \
    wget -O $SQL_WORKBENCH_HOME/drivers/redshift.jar https://s3.amazonaws.com/redshift-downloads/drivers/RedshiftJDBC42-1.1.17.1017.jar 

COPY entrypoint.sh WbDrivers.xml / 

ENTRYPOINT ["/entrypoint.sh"]
CMD ["java", "-jar" ,"/opt/sqlworkbench/sqlworkbench.jar"]
