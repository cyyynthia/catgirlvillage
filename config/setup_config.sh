#!/usr/bin/env sh
#! Copyright (c) Cynthia Rey, All rights reserved.
#! SPDX-License-Identifier: MPL-2.0
#!
#! This Source Code Form is subject to the terms of the Mozilla Public
#! License, v. 2.0. If a copy of the MPL was not distributed with this
#! file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Link nginx config files
ln -s /root/catgirlvillage/config/nginx/cv-website.conf /etc/nginx/sites-enabled/

# Link systemctl services & timers
ln -s /root/catgirlvillage/config/systemd/cv-minecraft.service /etc/systemd/system/
ln -s /root/catgirlvillage/config/systemd/cv-backup.service /etc/systemd/system/
ln -s /root/catgirlvillage/config/systemd/cv-backup.timer /etc/systemd/system/

# Enable stuff
systemctl enable cv-minecraft.service
systemctl enable cv-backup.timer

# Copy credentials files
cp credentials/ovh_backup_credentials /etc/ovh_backup_credentials
cp credentials/rcon_credentials /etc/rcon_credentials

# Protect credentials files
chmod 600 /etc/ovh_backup_credentials
chmod 600 /etc/rcon_credentials
