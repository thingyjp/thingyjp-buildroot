################################################################################
#
# thingyjp-ota
#
################################################################################

THINGYJP_OTA_VERSION = dev
THINGYJP_OTA_SITE = https://github.com/thingyjp/thingyjp-ota.git
THINGYJP_OTA_SITE_METHOD = git
THINGYJP_OTA_LICENSE = GPL-3.0
THINGYJP_OTA_LICENSE_FILES = LICENSE
THINGYJP_OTA_DEPENDENCIES =  host-thingyjp-ota thingymcconfig json-glib nettle
THINGYJP_OTA_GIT_SUBMODULES = YES
HOST_THINGYJP_OTA_DEPENDENCIES = host-json-glib host-nettle
HOST_THINGYJP_OTA_GIT_SUBMODULES = YES
HOST_THINGYJP_OTA_CONF_OPTS += -Dhost=true

define THINGYJP_OTA_INSTALLKEYS
	mkdir -p $(TARGET_DIR)/etc/thingyjp/ota/keys
	cp $(BR2_PACKAGE_THINGYJP_OTA_KEYSDIR)/rsa.pub $(TARGET_DIR)/etc/thingyjp/ota/keys/
endef

define THINGYJP_OTA_STAMPIMAGE
        mkdir -p $(TARGET_DIR)/etc/thingyjp/ota/
	$(HOST_DIR)/bin/ota_stamp -t $(TARGET_DIR) -r $(BR2_PACKAGE_THINGYJP_OTA_REPODIR)
endef

THINGYJP_OTA_POST_INSTALL_TARGET_HOOKS += THINGYJP_OTA_INSTALLKEYS

ifeq ($(BR2_PACKAGE_THINGYJP_OTA_STAMP),y)
	THINGYJP_OTA_POST_INSTALL_TARGET_HOOKS += THINGYJP_OTA_STAMPIMAGE
endif

$(eval $(meson-package))
$(eval $(host-meson-package))
