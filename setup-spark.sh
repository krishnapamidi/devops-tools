#!/bin/bash

SPARK_HOME=~/spark
SPARK_VERSION=2.0.1
SPARK_MIRROR=http://www.apache.org/dist/spark
sourceDir=`pwd`

echo "*** Installing Spark $SPARK_VERSION ..."
cd ~
wget -c $SPARK_MIRROR/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz; \
  tar -zxf spark-$SPARK_VERSION-bin-hadoop2.7.tgz; \
  rm -fr spark-$SPARK_VERSION-bin-hadoop2.7.tgz; \
  mv spark-$SPARK_VERSION-bin-hadoop2.7 $SPARK_HOME

echo "*** Configuring Spark ..."
cp -f $sourceDir/conf/spark/* $SPARK_HOME/conf/

echo '# Spark aliases' >> ~/.bashrc
echo "export SPARK_HOME=$SPARK_HOME" >> ~/.bashrc
echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> ~/.bashrc
source ~/.bashrc

mkdir /tmp/spark-events
spark-shell
