#!/vendor/bin/sh

notice()
{
	echo "$*"
	echo "$scriptname: $*" > /dev/kmsg
}

path=/etc/acdbdata
device=common
# For Potter India carrier, use seprate parameter files.
if [ "`getprop ro.carrier`" == "retin" ]
then
	device=retin
fi
index=0
for file in $(ls $path/$device/); do
    setprop persist.audio.calfile$index $path/$device/$file
    index=$((index+1))
done
notice "carrier: [`getprop ro.carrier`], calfile6: [`getprop persist.audio.calfile6`]"
