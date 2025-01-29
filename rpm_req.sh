#!/bin/bash

# Ensure there are dnf
apt install dnf

# Directory where you have your RPM packages and where you want to download the dependencies
repo_dir="/home/yasin/rocky_iso_update/new_iso_template/custom-repo"

# Ensure the repo directory exists
mkdir -p "$repo_dir"

# Loop through each RPM file in the repo directory
for rpm_package in "$repo_dir"/*.rpm; do
    echo "Processing package: $rpm_package"

    # Find and loop through all dependencies for the RPM package
    dnf repoquery --requires --recursive --resolve "$rpm_package" --qf "%{name}-%{version}-%{release}.%{arch}.rpm" | while read -r dep_rpm; do

        # Check if the dependency RPM already exists in the repo directory
        if [ ! -f "$repo_dir/$dep_rpm" ]; then
            echo "Downloading $dep_rpm"
            # Extract the package name from the RPM filename for download
            dep_name=$(echo "$dep_rpm" | sed 's/-[0-9].*//')
            sudo dnf download --resolve --downloaddir="$repo_dir" "$dep_name"
        else
            echo "Already exists: $dep_rpm, skipping."
        fi
    done
done

echo "All packages in the directory have been processed."