/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon.mixin;

import net.minecraft.world.entity.npc.Villager;
import net.minecraft.world.entity.npc.VillagerData;
import net.minecraft.world.entity.npc.VillagerProfession;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(Villager.class)
public abstract class VillagerMixin {
	@Shadow public abstract VillagerData getVillagerData();

	@Inject(method = "setVillagerData", at = @At("HEAD"), cancellable = true)
	public void setVillagerDataMixin(VillagerData newData, CallbackInfo ci) {
		VillagerProfession current = getVillagerData().getProfession();
		if (current != VillagerProfession.NONE && newData.getProfession() == VillagerProfession.NONE) {
			// Villagers no longer can lose their job, just like when you traded with them once.
			// This kills infinite villager re-roll to get enchantments such as Mending.
			ci.cancel();
		}
	}
}
