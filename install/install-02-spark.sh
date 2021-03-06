#!/usr/bin/env bash

# APACHE SPARK
export SPARK_VERSION=1.6.0
export HADOOP_VERSION=2.6
export SPARK_PACKAGE=$SPARK_VERSION-bin-hadoop$HADOOP_VERSION
export SPARK_HOME=/usr/spark-$SPARK_PACKAGE
export PATH=$PATH:$SPARK_HOME/bin
echo
echo
echo "Installing Apache Spark ${SPARK_VERSION}"
wget -c "http://mirrors.ibiblio.org/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_PACKAGE}.tgz"

tar zxvf spark-${SPARK_PACKAGE}.tgz -C /usr/
rm -f /usr/spark
ln -s $SPARK_HOME /usr/spark

#
# Reduce Login NOISE on Spark Shell 
sed 's/INFO/WARN/g' /usr/spark/conf/log4j.properties.template > /usr/spark/conf/log4j.properties

echo "Including Spark on PATH"
echo 'export PATH=$PATH:/usr/spark/bin/' > /etc/profile.d/spark.sh
