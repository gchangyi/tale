#!/bin/bash
APP_HOME=$(dirname $(which $0))
ps -eaf|grep -i "java .*-classpath .*${APP_HOME}/"|grep -v 'grep'
