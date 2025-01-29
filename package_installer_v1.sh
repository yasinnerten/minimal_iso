#!/bin/bash

# Path to the comps.xml file
COMPS_FILE="/home/yasin/rocky_iso_update/new_iso_template/custom-repo/comps.xml"
DEST_DIR="/home/yasin/rocky_iso_update/new_iso_template/custom-repo/Packages"
 
# Extract package names using xmlstarlet
PACKAGES=$(xmlstarlet sel -t -m '//packagereq[@type="default"]' -v . -n "$COMPS_FILE")

# Update package lists
#sudo dnf makecache

# Download each package without installing
for PACKAGE in $PACKAGES; do
  sudo dnf --downloadonly --downloaddir=$DEST_DIR $PACKAGE 
done
