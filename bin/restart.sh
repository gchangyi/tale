#!/bin/bash
# LAST UPDATES :
# 20170315 v1.1 -  created
####################################################################################################################################
# Script       : restart.sh
# Author       : gchangyi
# Version      : 1.1
# Lastupdate   : 15 Mar 2017
# Description  : This script is the application restart script
# Usage        : restart.sh
# Options      :
# Examples     : ./restart.sh
# the script can be run at any "folder" to give "absolute path" or "relative path" WITHOUT side effect(e.g /home/restart.sh)
####################################################################################################################################
APP_DIR="$(dirname $(which $0))"
cd $APP_DIR

./stop.sh
sleep 3s
./start.sh

