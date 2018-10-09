################################################################################
#
# thingymcconfig
#
################################################################################

THINGYMCCONFIG_VERSION = dev
THINGYMCCONFIG_SITE = https://github.com/fifteenhex/thingymcconfig.git
THINGYMCCONFIG_SITE_METHOD = git
THINGYMCCONFIG_LICENSE = GPL-3.0
THINGYMCCONFIG_LICENSE_FILES = LICENSE
THINGYMCCONFIG_DEPENDENCIES = host-pkgconf libmicrohttpd json-glib libnlglue libteenynet libgpiod
THINGYMCCONFIG_GIT_SUBMODULES = YES
THINGYMCCONFIG_INSTALL_STAGING = YES

THINGYMCCONFIG_CONF_OPTS += -Dwpasupplicantpath=/usr/sbin/wpa_supplicant

define THINGYMCCONFIG_INSTALL_INIT_SYSV
	sed s/TMPL_INTERFACE/$(BR2_PACKAGE_THINGYMCCONFIG_INTERFACE)/ $(THINGYMCCONFIG_PKGDIR)/S90thingymcconfig.template >\
		$(TARGET_DIR)/etc/init.d/S90thingmcconfig
	chmod 755 $(TARGET_DIR)/etc/init.d/S90thingmcconfig
endef

$(eval $(meson-package))
