#!/bin/bash
# LAST UPDATES :
# 20170315 v1.1 -  created
####################################################################################################################################
# Script       : start.sh
# Author       : gchangyi
# Version      : 1.1
# Lastupdate   : 15 Mar 2017
# Description  : This script is the application start script
# Usage        : start.sh
# Examples     : ./start.sh
# the script can be run at any "folder" to give "absolute path" or "relative path" WITHOUT side effect
######################################################################################################################################

JAVA_HOME="/usr/local/java8"
JAVA_CMD=$JAVA_HOME/bin/java
JAVA_OPTION="-Ddefault.client.encoding=UTF-8 -Dfile.encoding=UTF-8 -server -Xms128M -Xmx128M"
#GC_PARAMETER=" -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+PrintHeapAtGC -Xloggc:log/gc.txt" 
JMX_PORT=9001
JMX_OPTS=" -Dcom.sun.management.jmxremote.port=$JMX_PORT -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"

COLOR_RED="\\033[1;31m"
COLOR_GREEN="\\033[1;32m"
COLOR_DEFAULT="\\033[0m"

DT_NOW=`date '+%Y%m%d_%H%M%S'`

APP_HOME="$(dirname $(which $0))"
APP_LIB="$APP_HOME/lib"
for libfile in ${APP_LIB}/*.zip ; do
    if [ -f $libfile ] ; then
        CLASSPATH=$libfile:${CLASSPATH}
    fi
done
for libfile in ${APP_LIB}/*.jar ; do
    if [ -f $libfile ] ; then
        CLASSPATH=$libfile:${CLASSPATH}
    fi
done
CLASSPATH=${APP_HOME}:${APP_HOME}/resources:${CLASSPATH}

cd $APP_HOME
#echo $CLASSPATH
rsync -avc logs/* "logs_backup/${DT_NOW}/" >/dev/null 2>&1
rm -rf logs/*

sleep 1
#CMD="${JAVA_CMD} ${JAVA_OPTION} ${GC_PARAMETER} ${JMX_OPTS} -classpath ${CLASSPATH}\ com.tale.Application"
CMD="${JAVA_CMD} ${JAVA_OPTION} ${GC_PARAMETER} ${JMX_OPTS} -classpath ${CLASSPATH} -jar ${APP_HOME}/tale-1.2.1.jar"
`$CMD >>${APP_HOME}/logs/stderr.txt 2>&1 &`

sleep 3
ps -eaf |grep "java" |grep "${APP_HOME}/"
