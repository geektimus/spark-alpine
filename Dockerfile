FROM anapsix/alpine-java:8

# Environment Variables
ENV SCALA_HOME=/usr/local/development/scala
ENV SPARK_HOME=/usr/local/development/spark

# Update Alpine Software repository
RUN apk update

# Add certificates to wget to download scala
RUN apk add ca-certificates wget && update-ca-certificates

# Prepare the workspace
RUN mkdir /usr/local/development
WORKDIR /usr/local/development

# Prepare the workspace for Scala
RUN wget -t0 https://downloads.lightbend.com/scala/2.12.4/scala-2.12.4.tgz && \
    tar -xvf scala-2.12.4.tgz && \
    mv scala-2.12.4 scala && \
    rm -rf scala/api && \
    rm -rf scala/doc && \
    rm -rf scala/man && \
    rm scala-2.12.4.tgz

# Prepare the workspace for Spark
RUN wget -t0 http://apache.uniminuto.edu/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz && \
    tar -xvf spark-2.2.1-bin-hadoop2.7.tgz && \
    mv spark-2.2.1-bin-hadoop2.7 spark && \
    rm spark-2.2.1-bin-hadoop2.7.tgz 

ENV PATH=$SCALA_HOME/bin:$SPARK_HOME/bin:$PATH

CMD spark-shell