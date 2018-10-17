#!/bin/sh

set -x

REPODIR=`sed -rn "s/[A-Z0-9_]*THINGYJP_OTA_REPODIR=\"([a-z0-9/\.]*)\"/\1/p" $BR2_CONFIG`
KEYSDIR=`sed -rn "s/[A-Z0-9_]*THINGYJP_OTA_KEYSDIR=\"([a-z0-9/\.]*)\"/\1/p" $BR2_CONFIG`

if [ ! -n "$REPODIR" -o ! -d $REPODIR ]; then
	echo "repo dir doesn't exist"
	exit 1
fi

if [ ! -n "$REPODIR" -o ! -d $KEYSDIR ]; then
	echo "keys dir doesn't exist"
	exit 1
fi

echo "r " $REPODIR " k " $KEYSDIR

output/host/bin/ota_repo -r $REPODIR \
			 -k $KEYSDIR \
			 -p output/images/fit.img \
			 -s output/target/etc/thingyjp/ota/stamp.json \
			 --add
