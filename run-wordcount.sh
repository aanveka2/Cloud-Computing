#!/bin/bash 
 
# test the hadoop cluster by running wordcount 
 
# create input files  
rm -rf input 
rm -rf output 
mkdir input 
cp text.txt input/text.txt 
 
# create input directory on HDFS 
hadoop fs -mkdir -p input 
 
# put input files to HDFS 
hdfs dfs -put ./input/* input 
 
# run wordcount  
export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar 
hadoop com.sun.tools.javac.Main Vowels.java 
jar cf v.jar Vowels*.class 
hadoop jar v.jar Vowels input output 
 
# print the input files 
echo -e "\ninput text.txt:" 
hdfs dfs -cat input/text.txt 
 
# print the output of wordcount 
echo -e "\nwordcount output:" 
hdfs dfs -cat output/part-r-00000 
 
