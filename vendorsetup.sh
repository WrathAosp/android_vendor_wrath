devices=('beryllium' 'raphael' 'lavender' 'violet' 'mido' 'ginkgo' 'RMX1971' )

function lunch_devices() {
    add_lunch_combo wrath_${device}-user
    add_lunch_combo wrath_${device}-userdebug
}

for device in ${devices[@]}; do
    lunch_devices
done
