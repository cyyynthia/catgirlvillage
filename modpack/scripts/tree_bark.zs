/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import crafttweaker.api.item.IItemStack;

// Crafting recipes
craftingTable.removeByName("immersive_weathering:paper_from_birch_bark");

// Note: I could (and should've tbh) used a replacer, but I want to keep the original recipe as well
// and I honestly couldn't be bothered redoing this once it was working so here it is
craftingTable.addShapeless(
	"catgirlvillage/bark_to_paper",
	<item:minecraft:paper>,
	[
		<tag:items:immersive_weathering:bark>,
		<tag:items:immersive_weathering:bark>,
		<tag:items:immersive_weathering:bark>
	],
	null
);

craftingTable.addShapeless(
	"catgirlvillage/bark_to_organic_compost",
	<item:farmersdelight:organic_compost>,
	[
		<item:minecraft:dirt>,
		<item:farmersdelight:straw>,
		<item:farmersdelight:straw>,
		<item:minecraft:bone_meal>,
		<item:minecraft:bone_meal>,
		<tag:items:immersive_weathering:bark>,
		<tag:items:immersive_weathering:bark>,
		<tag:items:immersive_weathering:bark>,
		<tag:items:immersive_weathering:bark>
	],
	null
);

// Cutting recipes
var LOG_STRIPPED_BARK_LIST = [
	[ <item:minecraft:oak_log>, <item:minecraft:stripped_oak_log>, <item:immersive_weathering:oak_bark> ],
	[ <item:minecraft:spruce_log>, <item:minecraft:stripped_spruce_log>, <item:immersive_weathering:spruce_bark> ],
	[ <item:minecraft:birch_log>, <item:minecraft:stripped_birch_log>, <item:immersive_weathering:birch_bark> ],
	[ <item:minecraft:jungle_log>, <item:minecraft:stripped_jungle_log>, <item:immersive_weathering:jungle_bark> ],
	[ <item:minecraft:acacia_log>, <item:minecraft:stripped_acacia_log>, <item:immersive_weathering:acacia_bark> ],
	[ <item:minecraft:dark_oak_log>, <item:minecraft:stripped_dark_oak_log>, <item:immersive_weathering:dark_oak_bark> ],
	[ <item:minecraft:mangrove_log>, <item:minecraft:stripped_mangrove_log>, <item:immersive_weathering:mangrove_bark> ],
	[ <item:minecraft:cherry_log>, <item:minecraft:stripped_cherry_log>, <item:immersive_weathering:cherry_bark> ],
	[ <item:minecraft:bamboo_block>, <item:minecraft:stripped_bamboo_block>, <item:immersive_weathering:bamboo_bark> ],
	[ <item:minecraft:crimson_stem>, <item:minecraft:stripped_crimson_stem>, <item:immersive_weathering:crimson_scales> ],
	[ <item:minecraft:warped_stem>, <item:minecraft:stripped_warped_stem>, <item:immersive_weathering:warped_scales> ],

	[ <item:regions_unexplored:baobab_log>, <item:regions_unexplored:stripped_baobab_log>, <item:immersive_weathering:regions_unexplored/baobab_bark> ],
	[ <item:regions_unexplored:blackwood_log>, <item:regions_unexplored:stripped_blackwood_log>, <item:immersive_weathering:regions_unexplored/blackwood_bark> ],
	[ <item:regions_unexplored:blue_bioshroom_stem>, <item:regions_unexplored:stripped_blue_bioshroom_stem>, <item:immersive_weathering:regions_unexplored/blue_bioshroom_bark> ],
	[ <item:regions_unexplored:brimwood_log>, <item:regions_unexplored:stripped_brimwood_log>, <item:immersive_weathering:regions_unexplored/brimwood_scales> ],
	[ <item:regions_unexplored:cobalt_log>, <item:regions_unexplored:stripped_cobalt_log>, <item:immersive_weathering:regions_unexplored/cobalt_scales> ],
	[ <item:regions_unexplored:cypress_log>, <item:regions_unexplored:stripped_cypress_log>, <item:immersive_weathering:regions_unexplored/cypress_bark> ],
	[ <item:regions_unexplored:dead_log>, <item:regions_unexplored:stripped_dead_log>, <item:immersive_weathering:regions_unexplored/dead_scales> ],
	[ <item:regions_unexplored:eucalyptus_log>, <item:regions_unexplored:stripped_eucalyptus_log>, <item:immersive_weathering:regions_unexplored/eucalyptus_bark> ],
	[ <item:regions_unexplored:green_bioshroom_stem>, <item:regions_unexplored:stripped_green_bioshroom_stem>, <item:immersive_weathering:regions_unexplored/green_bioshroom_bark> ],
	[ <item:regions_unexplored:joshua_log>, <item:regions_unexplored:stripped_joshua_log>, <item:immersive_weathering:regions_unexplored/joshua_bark> ],
	[ <item:regions_unexplored:kapok_log>, <item:regions_unexplored:stripped_kapok_log>, <item:immersive_weathering:regions_unexplored/kapok_bark> ],
	[ <item:regions_unexplored:larch_log>, <item:regions_unexplored:stripped_larch_log>, <item:immersive_weathering:regions_unexplored/larch_bark> ],
	[ <item:regions_unexplored:magnolia_log>, <item:regions_unexplored:stripped_magnolia_log>, <item:immersive_weathering:regions_unexplored/magnolia_bark> ],
	[ <item:regions_unexplored:maple_log>, <item:regions_unexplored:stripped_maple_log>, <item:immersive_weathering:regions_unexplored/maple_bark> ],
	[ <item:regions_unexplored:mauve_log>, <item:regions_unexplored:stripped_mauve_log>, <item:immersive_weathering:regions_unexplored/mauve_bark> ],
	[ <item:regions_unexplored:palm_log>, <item:regions_unexplored:stripped_palm_log>, <item:immersive_weathering:regions_unexplored/palm_bark> ],
	[ <item:regions_unexplored:pine_log>, <item:regions_unexplored:stripped_pine_log>, <item:immersive_weathering:regions_unexplored/pine_bark> ],
	[ <item:regions_unexplored:pink_bioshroom_stem>, <item:regions_unexplored:stripped_pink_bioshroom_stem>, <item:immersive_weathering:regions_unexplored/pink_bioshroom_bark> ],
	[ <item:regions_unexplored:redwood_log>, <item:regions_unexplored:stripped_redwood_log>, <item:immersive_weathering:regions_unexplored/redwood_bark> ],
	[ <item:regions_unexplored:socotra_log>, <item:regions_unexplored:stripped_socotra_log>, <item:immersive_weathering:regions_unexplored/socotra_bark> ],
	[ <item:regions_unexplored:willow_log>, <item:regions_unexplored:stripped_willow_log>, <item:immersive_weathering:regions_unexplored/willow_bark> ],
	[ <item:regions_unexplored:yellow_bioshroom_stem>, <item:regions_unexplored:stripped_yellow_bioshroom_stem>, <item:immersive_weathering:regions_unexplored/yellow_bioshroom_scales> ],


	[ <item:minecraft:oak_wood>, <item:minecraft:stripped_oak_wood>, <item:immersive_weathering:oak_bark> ],
	[ <item:minecraft:spruce_wood>, <item:minecraft:stripped_spruce_wood>, <item:immersive_weathering:spruce_bark> ],
	[ <item:minecraft:birch_wood>, <item:minecraft:stripped_birch_wood>, <item:immersive_weathering:birch_bark> ],
	[ <item:minecraft:jungle_wood>, <item:minecraft:stripped_jungle_wood>, <item:immersive_weathering:jungle_bark> ],
	[ <item:minecraft:acacia_wood>, <item:minecraft:stripped_acacia_wood>, <item:immersive_weathering:acacia_bark> ],
	[ <item:minecraft:dark_oak_wood>, <item:minecraft:stripped_dark_oak_wood>, <item:immersive_weathering:dark_oak_bark> ],
	[ <item:minecraft:mangrove_wood>, <item:minecraft:stripped_mangrove_wood>, <item:immersive_weathering:mangrove_bark> ],
	[ <item:minecraft:cherry_wood>, <item:minecraft:stripped_cherry_wood>, <item:immersive_weathering:cherry_bark> ],
	[ <item:minecraft:crimson_hyphae>, <item:minecraft:stripped_crimson_hyphae>, <item:immersive_weathering:crimson_scales> ],
	[ <item:minecraft:warped_hyphae>, <item:minecraft:stripped_warped_hyphae>, <item:immersive_weathering:warped_scales> ],

	[ <item:regions_unexplored:baobab_wood>, <item:regions_unexplored:stripped_baobab_wood>, <item:immersive_weathering:regions_unexplored/baobab_bark> ],
	[ <item:regions_unexplored:blackwood_wood>, <item:regions_unexplored:stripped_blackwood_wood>, <item:immersive_weathering:regions_unexplored/blackwood_bark> ],
	[ <item:regions_unexplored:blue_bioshroom_hyphae>, <item:regions_unexplored:stripped_blue_bioshroom_hyphae>, <item:immersive_weathering:regions_unexplored/blue_bioshroom_bark> ],
	[ <item:regions_unexplored:brimwood_wood>, <item:regions_unexplored:stripped_brimwood_wood>, <item:immersive_weathering:regions_unexplored/brimwood_scales> ],
	[ <item:regions_unexplored:cobalt_wood>, <item:regions_unexplored:stripped_cobalt_wood>, <item:immersive_weathering:regions_unexplored/cobalt_scales> ],
	[ <item:regions_unexplored:cypress_wood>, <item:regions_unexplored:stripped_cypress_wood>, <item:immersive_weathering:regions_unexplored/cypress_bark> ],
	[ <item:regions_unexplored:dead_wood>, <item:regions_unexplored:stripped_dead_wood>, <item:immersive_weathering:regions_unexplored/dead_scales> ],
	[ <item:regions_unexplored:eucalyptus_wood>, <item:regions_unexplored:stripped_eucalyptus_wood>, <item:immersive_weathering:regions_unexplored/eucalyptus_bark> ],
	[ <item:regions_unexplored:green_bioshroom_hyphae>, <item:regions_unexplored:stripped_green_bioshroom_hyphae>, <item:immersive_weathering:regions_unexplored/green_bioshroom_bark> ],
	[ <item:regions_unexplored:joshua_wood>, <item:regions_unexplored:stripped_joshua_wood>, <item:immersive_weathering:regions_unexplored/joshua_bark> ],
	[ <item:regions_unexplored:kapok_wood>, <item:regions_unexplored:stripped_kapok_wood>, <item:immersive_weathering:regions_unexplored/kapok_bark> ],
	[ <item:regions_unexplored:larch_wood>, <item:regions_unexplored:stripped_larch_wood>, <item:immersive_weathering:regions_unexplored/larch_bark> ],
	[ <item:regions_unexplored:magnolia_wood>, <item:regions_unexplored:stripped_magnolia_wood>, <item:immersive_weathering:regions_unexplored/magnolia_bark> ],
	[ <item:regions_unexplored:maple_wood>, <item:regions_unexplored:stripped_maple_wood>, <item:immersive_weathering:regions_unexplored/maple_bark> ],
	[ <item:regions_unexplored:mauve_wood>, <item:regions_unexplored:stripped_mauve_wood>, <item:immersive_weathering:regions_unexplored/mauve_bark> ],
	[ <item:regions_unexplored:palm_wood>, <item:regions_unexplored:stripped_palm_wood>, <item:immersive_weathering:regions_unexplored/palm_bark> ],
	[ <item:regions_unexplored:pine_wood>, <item:regions_unexplored:stripped_pine_wood>, <item:immersive_weathering:regions_unexplored/pine_bark> ],
	[ <item:regions_unexplored:pink_bioshroom_hyphae>, <item:regions_unexplored:stripped_pink_bioshroom_hyphae>, <item:immersive_weathering:regions_unexplored/pink_bioshroom_bark> ],
	[ <item:regions_unexplored:redwood_wood>, <item:regions_unexplored:stripped_redwood_wood>, <item:immersive_weathering:regions_unexplored/redwood_bark> ],
	[ <item:regions_unexplored:socotra_wood>, <item:regions_unexplored:stripped_socotra_wood>, <item:immersive_weathering:regions_unexplored/socotra_bark> ],
	[ <item:regions_unexplored:willow_wood>, <item:regions_unexplored:stripped_willow_wood>, <item:immersive_weathering:regions_unexplored/willow_bark> ],
	[ <item:regions_unexplored:yellow_bioshroom_hyphae>, <item:regions_unexplored:stripped_yellow_bioshroom_hyphae>, <item:immersive_weathering:regions_unexplored/yellow_bioshroom_scales> ]
];

for entry in LOG_STRIPPED_BARK_LIST {
	var log = entry[0];
	var stripped = entry[1];
	var bark = entry[2];

	<recipetype:farmersdelight:cutting>.removeRecipe([stripped, <item:farmersdelight:tree_bark>]);
	<recipetype:farmersdelight:cutting>.addRecipe(
		"catgirlvillage/cutting/" + log.registryName.getPath() + "/" + bark.registryName.getPath(),
		log,
		[stripped, bark],
		<tag:items:minecraft:axes>,
		"minecraft:item.axe.strip"
	);
}
