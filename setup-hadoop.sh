#!/bin/bash

echo "Installing Oracle Java 8 ..."
sourceDir=`pwd`
cd ~
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.rpm"
sudo yum localinstall jdk-8u60-linux-x64.rpm
rm ~/jdk-8u60-linux-x64.rpm

echo "Installing Hadoop ..."
wget http://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz && \
  tar -zxf hadoop-2.7.3.tar.gz && \
  rm hadoop-2.7.3.tar.gz && \
  mv hadoop-2.7.3 ~/hadoop

echo "Initial Hadoop ..."
mv -f $sourceDir/conf/hadoop/* ~/hadoop/etc/hadoop/
echo 'export HADOOP_HOME=~/hadoop\nexport HADOOP_OPTS=-Djava.library.path=~/hadoop/lib/native\nexport PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc
source ~/.bashrc
hdfs namenode -format

echo "Generating ssh key"
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

echo "Starting Hdaoop ..."
start-dfs.sh
hdfs dfs -ls /
