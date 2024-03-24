/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon;

import com.mojang.logging.LogUtils;
import net.minecraftforge.fml.ModLoadingContext;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.config.ModConfig;
import org.slf4j.Logger;

@Mod(CVAddonMod.MOD_ID)
public class CVAddonMod {
	public static final String MOD_ID = "cvaddon";

	public static final Logger LOGGER = LogUtils.getLogger();

	public CVAddonMod() {
		ModLoadingContext.get().registerConfig(ModConfig.Type.SERVER, CVAddonServerConfig.SPEC);
	}
}
