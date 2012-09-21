#!/bin/sh

notify () {
  if [ ! -z "$1" ]; then
    /usr/local/bin/growlnotify -m "$1" -a "/Applications/Automounter.app"
  fi
}

host="192.168.1.40"
home="/Users/daytonn"
username="daytonn"
password="R0ckC00k13s"
mount="Drobo"
share="Dayton"
outp=`ping -c 1 $host | grep "0% packet loss"`

if [ -d "${home}/${mount}/${share}" ]; then
  umount "${home}/${mount}/${share}"
  rm -Rf "${home}/${mount}"
else
  mkdir "${home}/${mount}"
  mkdir "${home}/${mount}/${share}"

  if [ "$outp" = "1 packets transmitted, 1 packets received, 0.0% packet loss" ]; then
    dir="${home}/${mount}/${share}"

    if [ -d "$dir" ]; then
      mount_smbfs "//${username}:${password}@${host}/${mount}/${share}" "${home}/${mount}/${share}"
      if [ $? -eq 0 ]; then
        notify "${home}/${mount}/${share} mounted"
      fi
    fi
  else
    notify "Could not find $host..."

    if [ -d "${home}/${mount}" ]; then
      rm -Rf "${home}/${mount}"
    fi
  fi
fi