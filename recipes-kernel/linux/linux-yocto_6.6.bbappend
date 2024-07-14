# Modifications from the default:
# CONFIG_USB_ACM=y    : Enable the CDC ACM built-in driver.
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://defconfig"
