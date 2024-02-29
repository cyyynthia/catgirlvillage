#!/usr/bin/env sh
#! Copyright (c) Cynthia Rey, All rights reserved.
#! SPDX-License-Identifier: MPL-2.0
#!
#! This Source Code Form is subject to the terms of the Mozilla Public
#! License, v. 2.0. If a copy of the MPL was not distributed with this
#! file, You can obtain one at http://mozilla.org/MPL/2.0/.

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": Server restart in 10 minutes","color":"white"}]'
sleep 5m

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": Server restart in 5 minutes","color":"white"}]'
sleep 4m

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 1 minute","color":"gold"}]'
sleep 30s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 30 seconds","color":"gold"}]'
sleep 20s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 10 seconds","color":"red"}]'
sleep 5s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 5 seconds","color":"red"}]'
sleep 1s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 4 seconds","color":"red"}]'
sleep 1s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 3 seconds","color":"red"}]'
sleep 1s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 2 seconds","color":"red"}]'
sleep 1s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": ","color":"white"},{"text":"Server restart in 1 second","color":"red"}]'
sleep 1s

mcrcon -p "$RCON_PASSWORD" 'tellraw @a [{"text":"\u273f","color":"dark_red"},{"text":" Catgirl Village","color":"light_purple"},{"text":": Lights off! See you on the other side ","color":"white"},{"text":"uwu","obfuscated":true,"color":"white"}]'
sh ./backup.sh
