#!/bin/bash

case "$1" in
volume_up)
  pactl set-sink-volume @DEFAULT_SINK@ +5%
  ;;
volume_down)
  pactl set-sink-volume @DEFAULT_SINK@ -5%
  ;;
mute)
  pactl set-sink-mute @DEFAULT_SINK@ toggle
  ;;
brightness_up)
  brightnessctl set +5%
  ;;
brightness_down)
  brightnessctl set 5%-
  ;;
*)
  exit 1
  ;;
esac
