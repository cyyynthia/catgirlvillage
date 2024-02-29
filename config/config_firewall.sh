#! Copyright (c) Cynthia Rey, All rights reserved.
#! SPDX-License-Identifier: MPL-2.0
#!
#! This Source Code Form is subject to the terms of the Mozilla Public
#! License, v. 2.0. If a copy of the MPL was not distributed with this
#! file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Set default policies
ufw default deny incoming
ufw default allow outgoing
ufw deny out 25

# Allow base services
ufw allow ssh
ufw allow http
ufw allow https

# Minecraft-related config
ufw allow 25565/tcp # Minecraft server
ufw allow 24454/udp # Simple Voice Chat
