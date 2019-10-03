for id in `xinput --list | grep 'Logitech USB Receiver' | grep 'pointer' | perl -ne 'while (m/id=(\d+)/g){print "$1\n";}'`; do
    echo "setting device ID $id"
    xinput set-prop $id 'libinput Accel Profile Enabled' 0, 1
done 


cd /home/er/apps/k380-function-keys-conf
sudo ./k380_conf -d /dev/hidraw0 -f on
redshift -x
redshift -O 3000 # redshift -x
