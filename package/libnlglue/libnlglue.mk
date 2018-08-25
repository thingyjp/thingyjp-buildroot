################################################################################
#
# libnlglue
#
################################################################################

LIBNLGLUE_VERSION = dev
LIBNLGLUE_SITE = https://github.com/thingyjp/thingyjp-nlglue.git
LIBNLGLUE_SITE_METHOD = git
LIBNLGLUE_LICENSE = GPL-3.0
LIBNLGLUE_LICENSE_FILES = LICENSE
LIBNLGLUE_DEPENDENCIES = host-pkgconf libnl
LIBNLGLUE_INSTALL_STAGING = YES

$(eval $(meson-package))
