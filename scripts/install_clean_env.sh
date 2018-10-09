#!/bin/bash

# stop processing daemon
stop_process() {
    pro1=$(ps -ef|grep "$1" |grep -v grep| awk '{print $2}')
    [ -n "$pro1" ] && {
      echo $pro1 | xargs kill -9
    }
}

# clear user 
clear_user() {
    userName=$1
    id $userName > /dev/null 2>$1 && userdel -r $userName || echo "$userName is not exists"
    [ -d "/home/$userName" ] && rm -rf /home/$userName
}

# clear user data
clear_user_data() {
    for f in `ls /data/`; do
        ["$f" -gt -l ] &> /dev/null && rm -rf /data/$f/*
    done
    [ -d /data/sms ] && rm -rf /data/sms
}

# clear user log
clear_user_log() {
    [ -d /data/logs ] && rm -rf /data/logs/* || echo "/data/logs is not exists"
}

# clear user jvm file
clear_user_jvmdata() {
    jvm_data=/tmp/hsperfdata_$1
    [ -d "$jvm_data" ] && rm -rf $jvm_data
}

# execute clear
main() {
  echo "1、stop process deamon..."
      stop_process "sms"
  echo "2、clear user data..."
      clear_user_data
  echo "3、clear user log..."
      clear_user_log
  echo "4、clear_user..."
      clear_user "sms"
  echo "5、clear user jvm file..."
      clear_user_jvmdata "sms"
  echo "task done"
}

main
