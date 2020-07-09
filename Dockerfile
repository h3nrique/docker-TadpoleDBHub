FROM java:8-jre

EXPOSE 8080

ENV CATALINA_HOME /opt/tomcat
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.5.57
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV TADPOLE_WAR_URL https://sourceforge.net/projects/tadpoledbhub/files/2.1.x/2.1.0/ROOT.war/download

RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
    && tar -xvf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm -rf webapps/* \
    && rm tomcat.tar.gz* \
    && wget $TADPOLE_WAR_URL \
    && mv $CATALINA_HOME/download $CATALINA_HOME/webapps/ROOT.war \
    && chown -R 1001:0 $CATALINA_HOME \
    && chown -R 1001:0 $CATALINA_HOME/conf \
    && chmod -R g+rw $CATALINA_HOME \
    && chmod -R ug+rwx $CATALINA_HOME

USER 1001

CMD ["./bin/catalina.sh", "run"]
