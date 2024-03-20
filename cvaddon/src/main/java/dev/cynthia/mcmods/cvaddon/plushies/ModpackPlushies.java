/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon.plushies;

import dev.cynthia.mcmods.cvaddon.CVAddonMod;
import io.github.sirjain0.perfectplushies.block.PlayerPlushieBlock;
import io.github.sirjain0.perfectplushies.init.BlockInit;
import io.github.sirjain0.perfectplushies.item.PlayerPlushieBlockItem;
import net.minecraft.core.Holder;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceKey;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.Rarity;
import net.minecraft.world.level.block.Block;
import net.minecraftforge.event.entity.player.ItemTooltipEvent;
import net.minecraftforge.eventbus.api.SubscribeEvent;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.javafmlmod.FMLJavaModLoadingContext;
import net.minecraftforge.registries.DeferredRegister;
import net.minecraftforge.registries.ForgeRegistries;
import net.minecraftforge.registries.RegistryObject;

@Mod.EventBusSubscriber(modid = CVAddonMod.MOD_ID, bus = Mod.EventBusSubscriber.Bus.FORGE)
public class ModpackPlushies {
	private static final DeferredRegister<Block> BLOCKS = DeferredRegister.create(ForgeRegistries.BLOCKS, CVAddonMod.MOD_ID);
	private static final DeferredRegister<Item> ITEMS = DeferredRegister.create(ForgeRegistries.ITEMS, CVAddonMod.MOD_ID);

	public static final RegistryObject<Block> CYNTHIA_PLUSHIE = registerPlayerPlushie("cynthia_plushie", Rarity.EPIC);
	public static final RegistryObject<Block> PLUME_PLUSHIE = registerPlayerPlushie("plume_making_plushie", Rarity.EPIC);

	static {
		BLOCKS.register(FMLJavaModLoadingContext.get().getModEventBus());
		ITEMS.register(FMLJavaModLoadingContext.get().getModEventBus());
	}

	private static RegistryObject<Block> registerPlayerPlushie(String name, Rarity rarity) {
		RegistryObject<Block> plushie = BLOCKS.register(name, PlayerPlushieBlock::new);
		ITEMS.register(name, () -> new PlayerPlushieBlockItem(plushie.get(), rarity));

		io.github.sirjain0.perfectplushies.registration.RegistryObject<Block> object = toPerfectPlushiesObject(plushie);
		BlockInit.addToList(object, rarity);

		return plushie;
	}

	@SubscribeEvent
	public static void itemTooltipEvent(ItemTooltipEvent event) {
		if (ForgeRegistries.ITEMS.getKey(event.getItemStack().getItem()).getNamespace().equals(CVAddonMod.MOD_ID)) {
			for (Component component : event.getToolTip()) {
				System.out.println(component);
			}
		}
	}

	private static io.github.sirjain0.perfectplushies.registration.RegistryObject<Block> toPerfectPlushiesObject(RegistryObject<Block> block) {
		return new io.github.sirjain0.perfectplushies.registration.RegistryObject<>() {
			@Override
			public ResourceKey<Block> getResourceKey() {
				return block.getKey();
			}

			@Override
			public ResourceLocation getId() {
				return block.getId();
			}

			@Override
			public Block get() {
				return block.get();
			}

			@Override
			public Holder<Block> asHolder() {
				return block.getHolder().orElse(null);
			}
		};
	}
}
