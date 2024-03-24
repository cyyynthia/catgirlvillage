/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon;

import net.minecraftforge.common.ForgeConfigSpec;
import org.apache.commons.lang3.tuple.Pair;

public class CVAddonServerConfig {

	public static final CVAddonServerConfig CONFIG;
	public static final ForgeConfigSpec SPEC;

	public final ForgeConfigSpec.ConfigValue<String> DISCORD_WEBHOOK_URL;

	public CVAddonServerConfig(ForgeConfigSpec.Builder builder) {
		DISCORD_WEBHOOK_URL = builder.comment("Discord webhook URL for chat forwarding")
				.define("discord_webhook_url", "");
	}

	static {
		Pair<CVAddonServerConfig, ForgeConfigSpec> pair = new ForgeConfigSpec.Builder()
				.configure(CVAddonServerConfig::new);

		CONFIG = pair.getKey();
		SPEC = pair.getValue();
	}
}
