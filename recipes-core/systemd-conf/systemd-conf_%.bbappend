FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://eth.network \
    file://en.network \
    file://wlan.network \
    file://usb.network \
"

FILES:${PN} += " \
    ${sysconfdir}/systemd/network/eth.network \
    ${sysconfdir}/systemd/network/en.network \
    ${sysconfdir}/systemd/network/wlan.network \
    ${sysconfdir}/systemd/network/usb.network \
"

do_install:append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/eth.network ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/en.network ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/wlan.network ${D}${sysconfdir}/systemd/network
    install -m 0644 ${WORKDIR}/usb.network ${D}${sysconfdir}/systemd/network
}
