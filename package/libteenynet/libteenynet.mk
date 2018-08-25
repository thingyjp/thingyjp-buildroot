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
LIBTEENYNET_DEPENDENCIES = libglib2
LIBTEENYNET_INSTALL_STAGING = YES

$(eval $(meson-package))
