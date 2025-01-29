#!/bin/bash
#    -append-partition 2,0xef,$source_dir/images/efiboot.img \


iso_path="/home/yasin/rocky_iso_update/new_iso_created/Rocky-9-4-x86_64-dvd.iso"
label="Rocky-9-4-x86_64-dvd"
source_dir="/home/yasin/rocky_iso_update/new_iso_template"

mkisofs -R -no-emul-boot \
    -boot-load-size 4 \
    -boot-info-table \
    -V "$label" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -o $iso_path \
    -no-emul-boot \
    -eltorito-alt-boot \
    -e images/efiboot.img \
    -no-emul-boot \
    $source_dir

isohybrid $iso_path 