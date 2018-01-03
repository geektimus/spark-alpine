# Spark Apine Version

This is a small docker file that allow me to run spark (2.2.1) inside docker to avoid the installation of spark everytime I need to try something on the spark-shell on a new box / Environment

To build the image just do a 

```docker build . -t codingmaniacs/spark-alpine```

(Soon to be added to the docker hub 😁)

The testing of the spark-submit (submit jobs to the container) is pending 😅