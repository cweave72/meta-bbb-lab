# Modifications from the default:
# CONFIG_USB_ACM=y    : Enable the CDC ACM built-in driver.
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://defconfig"
# Kernel modules to be autoloaded.
KERNEL_MODULE_AUTOLOAD += "g_ether"
KERNEL_MODULE_PROBECONF += "g_ether"

