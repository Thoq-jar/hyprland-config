#!/bin/sh

# Set to true for Celsius, false for Fahrenheit
metric=false

if [ "$metric" = true ]; then
  req=$(curl -s "wttr.in/CITY?format=%t|%l+(%c%f)+%h,+%C&m")
  bar=$(echo $req | awk -F "|" '{print $1}' | sed 's/^+//')
  tooltip=$(echo $req | awk -F "|" '{print $2}')
  echo "{\"text\":\"$bar\", \"tooltip\":\"$tooltip\"}"
else
  req=$(curl -s "wttr.in/CITY?format=%t|%l+(%c%f)+%h,+%C")
  bar=$(echo $req | awk -F "|" '{print $1}' | sed 's/^+//')
  tooltip=$(echo $req | awk -F "|" '{print $2}')
  echo "{\"text\":\"$bar\", \"tooltip\":\"$tooltip\"}"
fi
