/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import crafttweaker.api.item.IItemStack;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.world.Container;

//region Wooden Trapdoors

// Craft registration helper
function createWoodenTrapdoorRecipe (ingredient as IItemStack, output as IItemStack) as void {
	craftingTable.remove(output);
	craftingTable.addShaped(
		"catgirlvillage/" + output.registryName.getNamespace() + "/" + output.registryName.getPath(),
		output * 6,
		[
			[ ingredient, ingredient, ingredient ],
			[ ingredient, ingredient, ingredient ]
		],
		null
	);
}

// Minecraft Vanilla
createWoodenTrapdoorRecipe(<item:minecraft:oak_planks>, <item:minecraft:oak_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:spruce_planks>, <item:minecraft:spruce_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:birch_planks>, <item:minecraft:birch_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:jungle_planks>, <item:minecraft:jungle_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:acacia_planks>, <item:minecraft:acacia_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:dark_oak_planks>, <item:minecraft:dark_oak_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:mangrove_planks>, <item:minecraft:mangrove_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:cherry_planks>, <item:minecraft:cherry_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:bamboo_planks>, <item:minecraft:bamboo_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:crimson_planks>, <item:minecraft:crimson_trapdoor>);
createWoodenTrapdoorRecipe(<item:minecraft:warped_planks>, <item:minecraft:warped_trapdoor>);

// Regions Unexplored
createWoodenTrapdoorRecipe(<item:regions_unexplored:baobab_planks>, <item:regions_unexplored:baobab_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:blackwood_planks>, <item:regions_unexplored:blackwood_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:blue_bioshroom_planks>, <item:regions_unexplored:blue_bioshroom_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:brimwood_planks>, <item:regions_unexplored:brimwood_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:cobalt_planks>, <item:regions_unexplored:cobalt_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:cypress_planks>, <item:regions_unexplored:cypress_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:dead_planks>, <item:regions_unexplored:dead_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:eucalyptus_planks>, <item:regions_unexplored:eucalyptus_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:green_bioshroom_planks>, <item:regions_unexplored:green_bioshroom_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:joshua_planks>, <item:regions_unexplored:joshua_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:kapok_planks>, <item:regions_unexplored:kapok_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:larch_planks>, <item:regions_unexplored:larch_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:magnolia_planks>, <item:regions_unexplored:magnolia_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:maple_planks>, <item:regions_unexplored:maple_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:mauve_planks>, <item:regions_unexplored:mauve_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:palm_planks>, <item:regions_unexplored:palm_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:pine_planks>, <item:regions_unexplored:pine_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:pink_bioshroom_planks>, <item:regions_unexplored:pink_bioshroom_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:redwood_planks>, <item:regions_unexplored:redwood_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:socotra_planks>, <item:regions_unexplored:socotra_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:willow_planks>, <item:regions_unexplored:willow_trapdoor>);
createWoodenTrapdoorRecipe(<item:regions_unexplored:yellow_bioshroom_planks>, <item:regions_unexplored:yellow_bioshroom_trapdoor>);

// Better archeology
createWoodenTrapdoorRecipe(<item:betterarcheology:rotten_planks>, <item:betterarcheology:rotten_trapdoor>);

// Vinery
createWoodenTrapdoorRecipe(<item:vinery:cherry_planks>, <item:vinery:cherry_trapdoor>);

//endregion

//region Metal trapdoors

// Craft registration helper
function createMetalTrapdoorRecipe (ingredient as IItemStack, output as IItemStack) as void {
	craftingTable.remove(output);
	craftingTable.addShaped(
		"catgirlvillage/" + output.registryName.getNamespace() + "/" + output.registryName.getPath(),
		output * 4,
		[
			[ ingredient, ingredient ],
			[ ingredient, ingredient ]
		],
		null
	);
}

// Minecraft Vanilla
createMetalTrapdoorRecipe(<item:minecraft:iron_ingot>, <item:minecraft:iron_trapdoor>);

// Supplementaries
createMetalTrapdoorRecipe(<item:minecraft:gold_ingot>, <item:supplementaries:gold_trapdoor>);

// Create Deco
createMetalTrapdoorRecipe(<item:create:andesite_alloy>, <item:createdeco:andesite_trapdoor>);
createMetalTrapdoorRecipe(<item:create:zinc_ingot>, <item:createdeco:zinc_trapdoor>);
createMetalTrapdoorRecipe(<item:create:brass_ingot>, <item:createdeco:brass_trapdoor>);
createMetalTrapdoorRecipe(<item:createdeco:industrial_iron_ingot>, <item:createdeco:industrial_iron_trapdoor>);
createMetalTrapdoorRecipe(<item:minecraft:copper_ingot>, <item:createdeco:copper_trapdoor>);

//endregion

//region Macaw's trapdoors

// Glass
for trapdoorBlockResource in <tag:blocks:mcwtrpdoors:glass_trapdoors>.idElements() {
	println(trapdoorBlockResource);
	var trapdoor = <block:${trapdoorBlockResource}>.asItem() as IItemStack;
	var recipe = craftingTable.getRecipesByOutput(trapdoor)[0] as Recipe<Container>;

	var ingredients = recipe.getIngredients();
	if (ingredients.length != 9) {
		val ingredient1 = ingredients[0] as IItemStack;
		val ingredient2 = ingredients[1] as IItemStack;

		craftingTable.remove(trapdoor);
		craftingTable.addShaped(
			"catgirlvillage/" + trapdoorBlockResource.getNamespace() + "/" + trapdoorBlockResource.getPath(),
			trapdoor * 4,
			[
				[ ingredient1, ingredient2, ingredient1 ],
				[ ingredient1, ingredient2, ingredient1 ]
			],
			null
		);
	}
}

// Bark
for trapdoorBlockResource in <tag:blocks:mcwtrpdoors:bark_trapdoors>.idElements() {
	println(trapdoorBlockResource);
	var trapdoor = <block:${trapdoorBlockResource}>.asItem() as IItemStack;
	var recipe = craftingTable.getRecipesByOutput(trapdoor)[0] as Recipe<Container>;

	var ingredients = recipe.getIngredients();
	val ingredient1 = ingredients[0] as IItemStack;
	val ingredient2 = ingredients[1] as IItemStack;

	craftingTable.remove(trapdoor);
	craftingTable.addShaped(
		"catgirlvillage/" + trapdoorBlockResource.getNamespace() + "/" + trapdoorBlockResource.getPath(),
		trapdoor * 4,
		[
			[ ingredient1, ingredient2, ingredient1 ],
			[ ingredient1, ingredient2, ingredient1 ]
		],
		null
	);
}

// Ranch
for trapdoorBlockResource in <tag:blocks:mcwtrpdoors:ranch_trapdoors>.idElements() {
	println(trapdoorBlockResource);
	var trapdoor = <block:${trapdoorBlockResource}>.asItem() as IItemStack;
	var recipe = craftingTable.getRecipesByOutput(trapdoor)[0] as Recipe<Container>;

	var ingredients = recipe.getIngredients();
	val ingredient1 = ingredients[0] as IItemStack;
	val ingredient2 = ingredients[1] as IItemStack;

	craftingTable.remove(trapdoor);
	craftingTable.addShaped(
		"catgirlvillage/" + trapdoorBlockResource.getNamespace() + "/" + trapdoorBlockResource.getPath(),
		trapdoor * 4,
		[
			[ ingredient1, ingredient2, ingredient1 ],
			[ ingredient2, ingredient2, ingredient2 ],
			[ ingredient1, ingredient2, ingredient1 ]
		],
		null
	);
}

// Bamboo
craftingTable.remove(<item:mcwtrpdoors:bamboo_trapdoor>);
craftingTable.addShaped(
	"catgirlvillage/mcwtrpdoors/bamboo_trapdoor",
	<item:mcwtrpdoors:bamboo_trapdoor> * 2,
	[
		[ <item:minecraft:bamboo>, <item:minecraft:bamboo>, <item:minecraft:bamboo> ],
		[ <item:minecraft:bamboo>, <item:minecraft:bamboo>, <item:minecraft:bamboo> ]
	],
	null
);

// Metal
craftingTable.remove(<item:mcwtrpdoors:metal_trapdoor>);
craftingTable.addShaped(
	"catgirlvillage/mcwtrpdoors/metal_trapdoor",
	<item:mcwtrpdoors:metal_trapdoor> * 4,
	[
		[ <item:minecraft:iron_ingot>, <item:minecraft:glass_pane>, <item:minecraft:iron_ingot> ],
		[ <item:minecraft:iron_ingot>, <item:minecraft:glass_pane>, <item:minecraft:iron_ingot> ]
	],
	null
);

// Metal warning
craftingTable.remove(<item:mcwtrpdoors:metal_warning_trapdoor>);
craftingTable.addShaped(
	"catgirlvillage/mcwtrpdoors/metal_warning_trapdoor",
	<item:mcwtrpdoors:metal_warning_trapdoor> * 4,
	[
		[ <item:minecraft:iron_ingot>, <item:minecraft:yellow_dye>, <item:minecraft:iron_ingot> ],
		[ <item:minecraft:iron_ingot>, <item:minecraft:black_dye>, <item:minecraft:iron_ingot> ]
	],
	null
);

//endregion
