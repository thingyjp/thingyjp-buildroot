#!/bin/sh
set -u
set -x
TARGETDIR="output/target"
rm -fv $TARGETDIR/usr/bin/cvtsudoers \
	$TARGETDIR/usr/bin/gapplication \
	$TARGETDIR/usr/bin/gdbus \
	$TARGETDIR/usr/bin/gio \
	$TARGETDIR/usr/bin/gio-querymodules \
	$TARGETDIR/usr/bin/json-glib-format \
	$TARGETDIR/usr/bin/json-glib-validate \
	$TARGETDIR/usr/bin/nettle-hash \
	$TARGETDIR/usr/bin/nettle-lfib-stream \
	$TARGETDIR/usr/bin/nettle-pbkdf2 \
	$TARGETDIR/usr/bin/pcretest \
	$TARGETDIR/usr/sbin/visudo \
	$TARGETDIR/usr/sbin/wpa_cli

