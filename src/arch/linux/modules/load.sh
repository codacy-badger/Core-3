#!/bin/sh
module="rs_ktblmgr"
device="ktblmgr"
mode="777"

make
cd schedule-hook
make
sudo insmod schedule.ko
cd ..
cd cross_state_manager
sudo insmod cross_state_manager.ko
cd ../intercept
./load.sh
# cat /sys/module/cross_state_manager/parameters/rootsim_pager_hook > /sys/module/schedule_hook/parameters/the_hook


# remove stale nodes
sudo rm -f /dev/${device}

major=$(awk -v module=$module '$2 == module { print $1 }' /proc/devices)

sudo mknod /dev/${device} c $major 1

# give appropriate group/permissions, and change the group.
sudo chgrp -hR $(groups) /dev/${device}
sudo chmod $mode  /dev/${device}

echo "Done"
