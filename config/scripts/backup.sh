#!/usr/bin/env sh
#! Copyright (c) Cynthia Rey, All rights reserved.
#! SPDX-License-Identifier: MPL-2.0
#!
#! This Source Code Form is subject to the terms of the Mozilla Public
#! License, v. 2.0. If a copy of the MPL was not distributed with this
#! file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Shutdown Minecraft server
systemctl stop cv-minecraft

# Go to Minecraft Server folder
cd ~/catgirlvillage

# Create TAR archive
tar --create --zstd --file /var/cv_world_backup.tar.zst world ops.json whitelist.json banned-ips.json banned-players.json

# Restart Minecraft server
# This is done immediately to not wait for the backup to be uploaded to OVH servers as that's unnecessary
systemctl start cv-minecraft

# Upload to OVHcloud' backup service, and remove old backups to save on storage space
echo $TODAY
ftp -n <<EOF
open $OVH_FTP_HOST
user $OVH_FTP_USER $OVH_FTP_PASS
mkdir cv_backups
cd cv_backups
rename world_backup.3.tar.zst world_backup.4.tar.zst
rename world_backup.2.tar.zst world_backup.1.tar.zst
rename world_backup.1.tar.zst world_backup.2.tar.zst
rename world_backup.tar.zst world_backup.1.tar.zst
put /var/cv_world_backup.tar.zst world_backup.tar.zst
del world_backup.4.tar.zst
bye
EOF
