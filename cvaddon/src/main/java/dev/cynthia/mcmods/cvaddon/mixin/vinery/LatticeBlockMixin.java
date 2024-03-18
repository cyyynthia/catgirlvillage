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
import satisfyu.vinery.block.stem.PaleStemBlock;

@Mixin(PaleStemBlock.class)
public class LatticeBlockMixin {
	@Inject(method = "randomTick", at = @At(value = "INVOKE", target = "Lnet/minecraft/server/level/ServerLevel;setBlock(Lnet/minecraft/core/BlockPos;Lnet/minecraft/world/level/block/state/BlockState;I)Z"), cancellable = true)
	public void forgeGrowHandlerPre(BlockState state, ServerLevel world, BlockPos pos, RandomSource random, CallbackInfo ci) {
		// Serene Seasons uses Forge events to implement the crop growth event
		CVAddonMod.LOGGER.debug("Captured LatticeBlock grow event");
		if (!ForgeHooks.onCropsGrowPre(world, pos, state, true)) {
			ci.cancel();
		}
	}

	@Inject(method = "randomTick", at = @At(value = "INVOKE", target = "Lnet/minecraft/server/level/ServerLevel;setBlock(Lnet/minecraft/core/BlockPos;Lnet/minecraft/world/level/block/state/BlockState;I)Z", shift = At.Shift.BY, by = 1))
	public void forgeGrowHandlerPost(BlockState state, ServerLevel world, BlockPos pos, RandomSource random, CallbackInfo ci) {
		ForgeHooks.onCropsGrowPost(world, pos, world.getBlockState(pos));
	}
}
