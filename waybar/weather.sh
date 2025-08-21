#!/usr/bin/sh

# Set to true for Celsius, false for Fahrenheit
metric=false

req=$(curl -s wttr.in/CITY?format="%t|%l+(%c%f)+%h,+%C")
bar=$(echo $req | awk -F "|" '{print $1}')
tooltip=$(echo $req | awk -F "|" '{print $2}')
temp_celsius=$(echo $bar | sed 's/[^0-9.-]*\([0-9.-]*\)[^0-9.-]*/\1/')
temp_fahrenheit=$(( (temp_celsius * 9 / 5) + 32 ))
temp_fahrenheit=$(printf "%.0f" $temp_fahrenheit)

if [ "$metric" = true ]; then
    bar="$temp_celsius°C"
else
    bar="$temp_fahrenheit°F"
fi

echo "{\"text\":\"$bar\", \"tooltip\":\"$tooltip\"}"
