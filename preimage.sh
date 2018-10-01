#!/bin/sh

set -x

${BR2_EXTERNAL_THINGYJP_PATH}/preimage_cleanup.sh
${BR2_EXTERNAL_THINGYJP_PATH}/preimage_rootfsprep.sh
${BR2_EXTERNAL_THINGYJP_PATH}/preimage_fstab.sh

