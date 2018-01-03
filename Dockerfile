FROM anapsix/alpine-java:8
# Update Alpine Software repository
RUN apk update

# Add certificates to wget to download scala
RUN apk add ca-certificates wget && update-ca-certificates

# Prepare the workspace for scala
RUN mkdir /usr/local/development
WORKDIR /usr/local/development
RUN wget -t0 https://downloads.lightbend.com/scala/2.12.4/scala-2.12.4.tgz
RUN tar -xvf scala-2.12.4.tgz
RUN rm scala-2.12.4.tgz

ENV SCALA_HOME=/usr/local/development/scala-2.12.4
#RUN PATH=$SCALA_HOME/bin:$PATH

# Spark
RUN wget -t0 http://apache.uniminuto.edu/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
RUN tar -xvf spark-2.2.1-bin-hadoop2.7.tgz
RUN rm spark-2.2.1-bin-hadoop2.7.tgz
ENV SPARK_HOME=/usr/local/development/spark-2.2.1-bin-hadoop2.7

ENV PATH=$SCALA_HOME/bin:$SPARK_HOME/bin:$PATH

CMD spark-shell