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
	if [ ! -d $(BR2_PACKAGE_THINGYJP_OTA_KEYSDIR) ]; then \
		echo "keys dir doesn't exist, creating it, you probably don't want this!"; \
		$(HOST_DIR)/bin/ota_keygen -k $(BR2_PACKAGE_THINGYJP_OTA_KEYSDIR); \
	fi

	mkdir -p $(TARGET_DIR)/etc/thingyjp/ota/keys
	cp $(BR2_PACKAGE_THINGYJP_OTA_KEYSDIR)/rsa.pub \
		$(TARGET_DIR)/etc/thingyjp/ota/keys/
endef

define THINGYJP_OTA_STAMPIMAGE
	mkdir -p $(TARGET_DIR)/etc/thingyjp/ota/
	$(HOST_DIR)/bin/ota_stamp -t $(TARGET_DIR) \
		-r $(BR2_PACKAGE_THINGYJP_OTA_REPODIR) endif
endef

ifneq ($(BR2_PACKAGE_THINGYJP_OTA_KEYSDIR),"")
	THINGYJP_OTA_POST_INSTALL_TARGET_HOOKS += THINGYJP_OTA_INSTALLKEYS
endif

ifeq ($(BR2_PACKAGE_THINGYJP_OTA_STAMP),y)
        ifneq ($(BR2_PACKAGE_THINGYJP_OTA_REPODIR),"")
		THINGYJP_OTA_TARGET_FINALIZE_HOOKS += THINGYJP_OTA_STAMPIMAGE
	endif
endif

define THINGYJP_OTA_INSTALL_INIT_SYSV
        sed -e s#TMPL_HOST#$(BR_PACKAGE_THINGYJP_OTA_HOST)# \
		-e s#TMPL_PATH#$(BR_PACKAGE_THINGYJP_OTA_PATH)# \
		$(THINGYJP_OTA_PKGDIR)/S91thingyjp-ota.template > \
                $(TARGET_DIR)/etc/init.d/S91thingyjp-ota
        chmod 755 $(TARGET_DIR)/etc/init.d/S91thingyjp-ota
endef

$(eval $(meson-package))
$(eval $(host-meson-package))
