/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon.discord;

// TODO: move to a standalone, clean mod dedicated to Discord proxying

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dev.cynthia.mcmods.cvaddon.CVAddonMod;
import dev.cynthia.mcmods.cvaddon.CVAddonServerConfig;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.player.Player;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.event.entity.EntityJoinLevelEvent;
import net.minecraftforge.event.entity.EntityLeaveLevelEvent;
import net.minecraftforge.event.server.ServerStartedEvent;
import net.minecraftforge.event.server.ServerStoppingEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.event.lifecycle.FMLDedicatedServerSetupEvent;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

@Mod.EventBusSubscriber(modid = CVAddonMod.MOD_ID, value = Dist.DEDICATED_SERVER)
public class ServerActivityForward {
	private static final String MARIE_AVATAR_URL = "https://catgirlvillage.maid.gg/_astro/marie-pixel.DoL5jzVg.png";

	private static final String AVATAR_URL_TEMPLATE = "https://mc-heads.net/avatar/%s/128";

	private static final JsonObject ALLOWED_MENTIONS = new JsonObject();

	private static final HttpClient HTTP_CLIENT = HttpClient.newHttpClient();

	static {
		JsonArray parse = new JsonArray();
		ALLOWED_MENTIONS.add("parse", parse);
	}

	@SubscribeEvent
	public static void serverOnlineHandler(ServerStartedEvent e) {
		sendMessageToDiscord("Catgirl Village", MARIE_AVATAR_URL, "\uD83D\uDFE2 Server is online");
	}

	@SubscribeEvent
	public static void serverOfflineHandler(ServerStoppingEvent e) {
		sendMessageToDiscord("Catgirl Village", MARIE_AVATAR_URL, "\uD83D\uDD34 Server is offline");
	}

	@SubscribeEvent
	public static void onPlayerJoin(EntityJoinLevelEvent e) {
		Entity entity = e.getEntity();
		if (entity instanceof Player) {
			sendMessageToDiscord(((Player) entity), "*joined the game*");
		}
	}

	@SubscribeEvent
	public static void onPlayerLeave(EntityLeaveLevelEvent e) {
		Entity entity = e.getEntity();
		if (entity instanceof Player) {
			sendMessageToDiscord(((Player) entity), "*left the game*");
		}
	}

	private static void sendMessageToDiscord(Player player, String content) {
		sendMessageToDiscord(
				player.getGameProfile().getName(),
				AVATAR_URL_TEMPLATE.formatted(player.getGameProfile().getId()),
				content
		);
	}

	private static void sendMessageToDiscord(String username, String avatarUrl, String content) {
		String discordUrl = CVAddonServerConfig.CONFIG.DISCORD_WEBHOOK_URL.get();
		if (discordUrl.isEmpty()) return;

		JsonObject data = new JsonObject();
		data.add("allowed_mentions", ALLOWED_MENTIONS);
		data.addProperty("username", username);
		data.addProperty("avatar_url", avatarUrl);
		data.addProperty("content", content);

		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(discordUrl))
				.version(HttpClient.Version.HTTP_2)
				.timeout(Duration.ofSeconds(10))
				.header("Content-Type", "application/json")
				.header("User-Agent", "CVAddonMod")
				.POST(HttpRequest.BodyPublishers.ofString(data.toString()))
				.build();

		HTTP_CLIENT
				.sendAsync(request, HttpResponse.BodyHandlers.discarding())
				.thenAccept(res -> CVAddonMod.LOGGER.debug("Forwarded event to Discord (HTTP {})", res.statusCode()))
				.exceptionally(ex -> {
					CVAddonMod.LOGGER.error("Failed to perform HTTP request to Discord!", ex);
					return null;
				});
	}
}
