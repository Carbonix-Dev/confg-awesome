#!/bin/bash

SINK=$(LC_ALL=C pactl get-default-sink)

case $1 in

  "volume")
    echo $(LC_ALL=C pactl get-sink-volume $(LC_ALL=C pactl get-default-sink) | awk '{print $5}')
  ;;

  "mute")
    echo $(LC_ALL=C pactl get-sink-mute $(LC_ALL=C pactl get-default-sink))
  ;;

  "set_sink")
    $(LC_ALL=C pactl set-default-sink $2)
  ;;
esac
