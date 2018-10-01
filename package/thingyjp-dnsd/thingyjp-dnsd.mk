################################################################################
#
# thingyjp-dnsd
#
################################################################################

THINGYJP_DNSD_VERSION = dev
THINGYJP_DNSD_SITE = https://github.com/thingyjp/thingyjp-dnsd.git
THINGYJP_DNSD_SITE_METHOD = git
THINGYJP_DNSD_LICENSE = GPL-3.0
THINGYJP_DNSD_LICENSE_FILES = LICENSE
THINGYJP_DNSD_DEPENDENCIES = libglib2

define THINGYJP_DNSD_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(THINGYJP_DNSD_PKGDIR)/S90thingyjp-dnsd $(TARGET_DIR)/etc/init.d/S90thingyjp-dnsd
endef

$(eval $(meson-package))
