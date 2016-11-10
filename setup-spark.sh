#!/bin/bash

HADOOP_HOME=hadoop
SPARK_HOME=spark
SPARK_VERSION=2.0.1
SPARK_MIRROR=http://www.apache.org/dist/spark
sourceDir=`pwd`

cd ~
wget -c $SPARK_MIRROR/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz; \
  tar -zxf spark-$SPARK_VERSION-bin-hadoop2.7.tgz; \
  rm -fr spark-$SPARK_VERSION-bin-hadoop2.7.tgz; \
  mv spark-$SPARK_VERSION-bin-hadoop2.7 $SPARK_HOME

cp -f $sourceDir/conf/spark/* $SPARK_HOME/conf/

