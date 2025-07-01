# Change this according to your device
################
# Variables
################

# Keyboard input name

# Date and time
date_and_week=$(date "+%Y/%m/%d")
current_time=$(date "+%H:%M")

#############
# Commands
#############

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')
# Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
# interface_easyname grabs the "old" interface name before systemd renamed it
wifi_connected=$(nmcli d show wlo1 | awk -F ' ' 'NR==6 {print $2}')
# Others
loadavg_5min=$(cat /proc/loadavg | awk -F ' ' '{print $2}')

if ! [ $network ];
then
   network_active="⛔"
else
   network_active="⇆"
fi

if [ $(pamixer --get-mute) == "true" ];
then
	audio_volume="0"
else
	audio_volume=$(pamixer --get-volume)
fi

echo "| $network_active $wifi_connected  | $loadavg_5min | vol: $audio_volume% | $battery_status $battery_charge | $date_and_week $current_time"

# nmcli d show wlo1 | awk -F ' ' 'NR==6 {print }'
