for device in $(cat $(gettop)/vendor/wrath/wrath.devices | sed -e 's/#.*$//' | awk '{printf "wrath_%s-userdebug\n", $1}'); do
    add_lunch_combo $device;
done;
