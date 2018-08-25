################################################################################
#
# libteenynet
#
################################################################################

LIBTEENYNET_VERSION = dev
LIBTEENYNET_SITE = https://github.com/thingyjp/thingyjp-teenynet.git
LIBTEENYNET_SITE_METHOD = git
LIBTEENYNET_LICENSE = GPL-3.0
LIBTEENYNET_LICENSE_FILES = LICENSE
LIBTEENYNET_DEPENDENCIES = host-pkgconf json-glib liboping

$(eval $(meson-package))
