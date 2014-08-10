#!/bin/bash

KERN_DIR=/usr/src/kernels/`uname -r`
export KERN_DIR
export MAKE='/usr/bin/gmake -i'

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /tmp/isomount

# Install the drivers
/tmp/isomount/VBoxLinuxAdditions.run --nox11

# Cleanup
umount isomount
rm -rf isomount /root/VBoxGuestAdditions.iso
