#!/bin/bash
mkdir -p /home/yasin/rocky_iso_update/new_iso_template/custom-repo
mkdir -p /home/yasin/rocky_iso_update/new_iso_template/custom-repo/Packages
chmod 777 /home/yasin/rocky_iso_update/new_iso_template/custom-repo

createrepo_c -v --groupfile "/home/yasin/rocky_iso_update/new_iso_template/custom-repo/comps.xml" /home/yasin/rocky_iso_update/new_iso_template/custom-repo
#--basedir "/home/yasin/rocky_iso_update/new_iso_template/custom-repo/Packages"
