/*
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

package dev.cynthia.mcmods.cvaddon.mixin.create;

import com.simibubi.create.content.contraptions.behaviour.MovementContext;
import com.simibubi.create.content.kinetics.base.BlockBreakingMovementBehaviour;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(value = BlockBreakingMovementBehaviour.class, remap = false)
public abstract class BlockBreakingMovementBehaviorMixin {
	@Inject(method = "getBlockBreakingSpeed", at = @At("RETURN"), cancellable = true)
	public void getBlockBreakingSpeed(MovementContext context, CallbackInfoReturnable<Float> cir) {
		float speed = cir.getReturnValue();
		cir.setReturnValue(speed / 4);
	}
}
