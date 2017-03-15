#!/bin/bash
# LAST UPDATES :
# 20170315 v1.1 -  created
####################################################################################################################################
# Script       : stop.sh
# Author       : gchangyi
# Version      : 1.1
# Lastupdate   : 15 Mar 2017
# Description  : This script is the application stop script
# Usage        : stop.sh
# Examples     : ./stop.sh
# the script can be run at any "folder" to give "absolute path" or "relative path" WITHOUT side effect
######################################################################################################################################

PROCESS_NAME="$(dirname $(which $0))"
kill -9 $(ps -eaf|grep -i "java .*-classpath .*${PROCESS_NAME}/"|grep -v 'grep'|awk '{print $2}')
