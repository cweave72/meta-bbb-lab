## Beaglebone Black Yocto layer

This is layer used to build a lab-tool Beaglebone Black image with various
networking and utilities included.

Build the image:  `bitbake core-image-lab`

This layer depends on:

    URI: git://git.yoctoproject.org/poky.git
    branch: scarthgap

    URI: git://git.openembedded.org/meta-openembedded
    branch: scarthgap


## USB interface notes

### BeagleBone side

The g_ether (gadget) driver is configured to assign the following MAC addresses:

- host:   `c0:00:20:35:44:00`
- device: `c0:00:20:35:44:01`

This is configured in the layer.conf:
```
# Kernel modules to be autoloaded.
KERNEL_MODULE_AUTOLOAD += "g_ether"
KERNEL_MODULE_PROBECONF += "g_ether"
module_conf_g_ether = "options g_ether dev_addr=c0:00:20:35:44:01 host_addr=c0:00:20:35:44:00"
```

`/etc/network/interfaces` is configured to set the device-side ip to: `192.168.7.2`

The host should set it's interface to something: `192.168.7.x`

### Host side

Create a udev rule: `/etc/udev/rules.d/70-persistent-net.rules`:
```
ACTION=="add", SUBSYSTEM=="net", ATTR{address}=="c0:00:20:35:44:00", NAME="usb_bbb", RUN+="/opt/bbb/on_connect.sh"
```

Restart udev:
```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

On connection, the udev rule will run and the network interface will be renamed
`usb_bbb` and the `/opt/bbb/on_connect.sh` script will run. The *on_connect.sh*
script will assign the IP address to the interface.

Contents of *on_connect.sh*:
```bash
#!/bin/sh

log=/opt/bbb/bbb_udev.txt

# Set the static ip of the interface.
ip=192.168.7.1
ifconfig usb_bbb $ip

if [ ! "$?" -eq 0 ]; then
    echo "$(date): Beaglebone Black usb connect. Failed to set ip address." > $log
    exit 1
fi

echo "$(date): Beaglebone Black usb connect." > $log
echo $(ifconfig usb_bbb) >> $log
```

