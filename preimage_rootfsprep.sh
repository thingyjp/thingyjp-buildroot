#!/bin/sh

set -u

TARGETDIR="output/target"

mkdir -p $TARGETDIR/space
date -u +"%Y-%m-%d %H:%M:%S" > $TARGETDIR/etc/buildstamp
