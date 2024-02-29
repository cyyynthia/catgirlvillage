#!/usr/bin/env sh
#! Copyright (c) Cynthia Rey, All rights reserved.
#! SPDX-License-Identifier: MPL-2.0
#!
#! This Source Code Form is subject to the terms of the Mozilla Public
#! License, v. 2.0. If a copy of the MPL was not distributed with this
#! file, You can obtain one at http://mozilla.org/MPL/2.0/.

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: Server restart in §u10 minutes§r"
sleep 5m

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: Server restart in §u5 minutes§r"
sleep 4m

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §6Server restart in §u1 minute§r"
sleep 30s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §6Server restart in §u30 seconds§r"
sleep 20s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §cServer restart in §u10 seconds§r"
sleep 5s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §cServer restart in §u5 seconds§r"
sleep 1s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §cServer restart in §u4 seconds§r"
sleep 1s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §cServer restart in §u3 seconds§r"
sleep 1s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §cServer restart in §u2 seconds§r"
sleep 1s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §cServer restart in §u1 second§r"
sleep 1s

mcrcon -p $RCON_PASSWORD "tellraw §4✿ §dCatgirl Village§f: §oLights off! See you on the other side"
sh backup.sh
