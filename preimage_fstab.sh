#!/bin/sh

set -u
set -x

SPACE_PATH=`sed -rn "s/THINGYJP_SPACE_PATH=\"([a-z0-9/]*)\"/\1/p" $BR2_CONFIG`
SPACE_TYPE=`sed -rn "s/THINGYJP_SPACE_TYPE=\"([a-z0-9/]*)\"/\1/p" $BR2_CONFIG`
FSTAB=output/target/etc/fstab
FSTABTMP=output/target/etc/fstab.tmp

sed -e '/##thingyjp/,+1d' ${FSTAB} > ${FSTABTMP}
echo "##thingyjp" >> ${FSTABTMP}
echo "${SPACE_PATH}\t/space\t${SPACE_TYPE}\tdefaults\t0\t0" >> ${FSTABTMP}
mv $FSTABTMP $FSTAB
