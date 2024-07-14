# Add files to the base-files recipe.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://fstab \
    file://interfaces \
    file://aliases.sh \
    "

do_install:append() {
    install -d ${D}/mnt/sdcard/boot
    install -d ${D}/${sysconfdir}/network
    install -d ${D}/${sysconfdir}/profile.d
    install -D -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/
    install -D -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/
    install -D -m 0644 ${WORKDIR}/aliases.sh ${D}${sysconfdir}/profile.d/
}
