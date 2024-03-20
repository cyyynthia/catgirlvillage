/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon.mixin.vinery;

import dev.cynthia.mcmods.cvaddon.CVAddonMod;
import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.util.RandomSource;
import net.minecraft.world.level.block.LeavesBlock;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraftforge.common.ForgeHooks;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;
import satisfyu.vinery.block.CherryLeaves;

@Mixin(CherryLeaves.class)
public abstract class CherryLeavesMixin extends LeavesBlock {
	public CherryLeavesMixin(Properties props) {
		super(props);
	}

	@Inject(method = "randomTick", at = @At(value = "INVOKE", target = "Lnet/minecraft/world/level/block/state/BlockState;setValue(Lnet/minecraft/world/level/block/state/properties/Property;Ljava/lang/Comparable;)Ljava/lang/Object;"), cancellable = true)
	public void forgeGrowHandlerPre(BlockState state, ServerLevel world, BlockPos pos, RandomSource random, CallbackInfo ci) {
		// Serene Seasons uses Forge events to implement the crop growth event
		CVAddonMod.LOGGER.debug("Captured CherryLeaves grow event");
		if (!ForgeHooks.onCropsGrowPre(world, pos, state, true)) {
			ci.cancel();

			// We still should call `super`, to keep the vine growth behavior unaffected
			super.randomTick(state, world, pos, random);
		}
	}

	@Inject(method = "randomTick", at = @At(value = "INVOKE", target = "Lnet/minecraft/server/level/ServerLevel;setBlockAndUpdate(Lnet/minecraft/core/BlockPos;Lnet/minecraft/world/level/block/state/BlockState;)Z", shift = At.Shift.BY, by = 1))
	public void forgeGrowHandlerPost(BlockState state, ServerLevel world, BlockPos pos, RandomSource random, CallbackInfo ci) {
		ForgeHooks.onCropsGrowPost(world, pos, world.getBlockState(pos));
	}
}
