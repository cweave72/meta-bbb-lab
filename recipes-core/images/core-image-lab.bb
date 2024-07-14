SUMMARY = "Beaglebone black lab-use image"

inherit core-image

IMAGE_FEATURES += "ssh-server-dropbear tools-debug debug-tweaks package-management"

EXTRA_TOOLS = " \
    minicom \
    picocom \
    lsof \
    iptables \
    dhcpcd \
    iperf3 \
    tcpdump \
    ethtool \
    zip \
    socat \
    netcat \
    parted \
    e2fsprogs-resize2fs \
"

# Add extra recipes to be installed to the image here:
# util-linux: provides linux utils (disk partitioning, kernel message
# 	management, filesystem creation, etc..
# ncurses-tools: provides tic (needed for ssh server)
# python3: provides python (also needed for ssh server)
IMAGE_INSTALL:append = " \
  kernel-modules \
  packagegroup-base-3g \
  usbinit \
  python3 \
  util-linux \
  ncurses-tools \
  ${EXTRA_TOOLS} \
"


