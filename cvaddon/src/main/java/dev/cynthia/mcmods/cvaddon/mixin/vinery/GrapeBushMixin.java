package dev.cynthia.mcmods.cvaddon.mixin.vinery;

import dev.cynthia.mcmods.cvaddon.CVAddonMod;
import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.util.RandomSource;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraftforge.common.ForgeHooks;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;
import org.spongepowered.asm.mixin.injection.callback.LocalCapture;
import satisfyu.vinery.block.grape.GrapeBush;

@Mixin(GrapeBush.class)
public class GrapeBushMixin {
	@Inject(method = "randomTick", at = @At(value = "INVOKE", target = "Lnet/minecraft/world/level/block/state/BlockState;setValue(Lnet/minecraft/world/level/block/state/properties/Property;Ljava/lang/Comparable;)Ljava/lang/Object;"), cancellable = true)
	public void forgeGrowHandlerPre(BlockState state, ServerLevel world, BlockPos pos, RandomSource random, CallbackInfo ci) {
		// Serene Seasons uses Forge events to implement the crop growth event
		CVAddonMod.LOGGER.debug("Captured GrapeBush grow event");
		if (!ForgeHooks.onCropsGrowPre(world, pos, state, true)) {
			ci.cancel();
		}
	}

	@Inject(method = "randomTick", at = @At(value = "INVOKE", target = "Lnet/minecraft/server/level/ServerLevel;gameEvent(Lnet/minecraft/world/level/gameevent/GameEvent;Lnet/minecraft/core/BlockPos;Lnet/minecraft/world/level/gameevent/GameEvent$Context;)V", shift = At.Shift.BY, by = 1), locals = LocalCapture.CAPTURE_FAILHARD)
	public void forgeGrowHandlerPost(BlockState state, ServerLevel world, BlockPos pos, RandomSource random, CallbackInfo ci, int ageBefore, BlockState updatedBlockState) {
		ForgeHooks.onCropsGrowPost(world, pos, updatedBlockState);
	}
}
