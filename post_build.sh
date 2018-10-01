#!/bin/sh
set -u
set -x

TARGETDIR="output/target"
rm -frv $TARGETDIR/usr/bin/cvtsudoers \
	$TARGETDIR/usr/bin/gapplication \
	$TARGETDIR/usr/bin/gdbus \
	$TARGETDIR/usr/bin/gio \
	$TARGETDIR/usr/bin/gio-querymodules \
	$TARGETDIR/usr/bin/gsettings \
	$TARGETDIR/usr/bin/gresource \
	$TARGETDIR/usr/bin/json-glib-format \
	$TARGETDIR/usr/bin/json-glib-validate \
	$TARGETDIR/usr/bin/nettle-hash \
	$TARGETDIR/usr/bin/nettle-lfib-stream \
	$TARGETDIR/usr/bin/nettle-pbkdf2 \
	$TARGETDIR/usr/bin/pcretest \
	$TARGETDIR/usr/bin/asn1Coding \
	$TARGETDIR/usr/bin/asn1Decoding \
	$TARGETDIR/usr/bin/asn1Parser \
	$TARGETDIR/usr/bin/rngtest \
	$TARGETDIR/usr/bin/sudoreplay \
	$TARGETDIR/usr/bin/pcregrep \
	$TARGETDIR/usr/bin/pkcs1-conv \
	$TARGETDIR/usr/bin/sexp-conv \
	$TARGETDIR/usr/bin/sqlite3 \
	$TARGETDIR/usr/bin/xmllint \
	$TARGETDIR/usr/sbin/visudo \
	$TARGETDIR/usr/sbin/wpa_cli \
	$TARGETDIR/etc/services \
	$TARGETDIR/etc/wpa_supplicant.conf \
	$TARGETDIR/usr/share/glib-2.0/valgrind/glib.supp \
	$TARGETDIR/usr/libexec/installed-tests \
	$TARGETDIR/usr/share/installed-tests

#clean up GPSd
rm -frv $TARGETDIR/usr/bin/gps2udp \
	$TARGETDIR/usr/bin/gpsdecode \
	$TARGETDIR/usr/bin/gpspipe \
	$TARGETDIR/usr/bin/gpxlogger \
	$TARGETDIR/usr/bin/gpsctl \
	$TARGETDIR/usr/bin/lcdgps

date -u +"%Y-%m-%d %H:%M:%S" > $TARGETDIR/etc/buildstamp

mkdir -p $TARGETDIR/space
