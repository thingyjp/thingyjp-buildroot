################################################################################
#
# thingyjp-connector-mqtt
#
################################################################################

THINGYJP_CONNECTOR_MQTT_VERSION = dev
THINGYJP_CONNECTOR_MQTT_SITE = https://github.com/thingyjp/thingyjp-connector-mqtt.git
THINGYJP_CONNECTOR_MQTT_SITE_METHOD = git
THINGYJP_CONNECTOR_MQTT_LICENSE = GPL-3.0
THINGYJP_CONNECTOR_MQTT_LICENSE_FILES = LICENSE
THINGYJP_CONNECTOR_MQTT_DEPENDENCIES = host-pkgconf
THINGYJP_CONNECTOR_MQTT_GIT_SUBMODULES = YES

$(eval $(meson-package))
