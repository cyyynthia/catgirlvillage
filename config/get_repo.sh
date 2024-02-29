#!/usr/bin/env sh
#! Copyright (c) Cynthia Rey, All rights reserved.
#! SPDX-License-Identifier: MPL-2.0
#!
#! This Source Code Form is subject to the terms of the Mozilla Public
#! License, v. 2.0. If a copy of the MPL was not distributed with this
#! file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Use sparse index to only pull config-related stuff
git clone --depth 1 --branch mistress --no-checkout https://github.com/cyyynthia/catgirlvillage
cd catgirlvillage

git sparse-checkout set config LICENSE README.md
git checkout mistress
