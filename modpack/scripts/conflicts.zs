/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import crafttweaker.api.recipe.MirrorAxis;

craftingTable.remove(<item:vinery:apple_crate>); // Crate delight has it
craftingTable.remove(<item:cratedelight:salmon_crate>); // Crabbers delight has it
craftingTable.remove(<item:cratedelight:cod_crate>); // Crabbers delight has it
craftingTable.remove(<item:supplementaries:sugar_cube>); // Crate delight has it

campfire.remove(<item:farmersdelight:fried_egg>); // Naturalist has a more generic one
furnace.remove(<item:farmersdelight:fried_egg>);
smoker.remove(<item:farmersdelight:fried_egg>);
campfire.remove(<item:croptopia:popcorn>); // Corn delight has it
furnace.remove(<item:croptopia:popcorn>);
smoker.remove(<item:croptopia:popcorn>);

furnace.remove(<item:createdeco:cracked_red_bricks>); // Immersive Weathering has it
craftingTable.remove(<item:createdeco:mossy_red_bricks>); // Immersive Weathering has it
craftingTable.remove(<item:regions_unexplored:mossy_stone>); // Immersive Weathering has it

craftingTable.remove(<item:regions_unexplored:blackstone_cluster>); // Useless + conflicts with vanilla

// Conflict with Macaw's Windows bamboo shutter
craftingTable.remove(<item:supplementaries:flute>);
craftingTable.addShaped(
	"catgirlvillage/supplementaries/flute",
	<item:supplementaries:flute>,
	[
		[ <item:minecraft:air>, <item:minecraft:air>, <item:minecraft:bamboo>, ],
		[ <item:minecraft:air>, <item:minecraft:bamboo>, <item:minecraft:air>, ],
		[ <item:minecraft:bamboo>, <item:minecraft:air>, <item:minecraft:air>, ],
	],
	null
);

// Conflicts with Immersive Weathering
var CONFLICTING = [ "white_magnolia", "pink_magnolia", "blue_magnolia" ];
for conflict in CONFLICTING {
	craftingTable.remove(<item:regions_unexplored:${conflict}_flowers>);
	craftingTable.addShapedMirrored(
		"catgirlvillage/regions_unexplored/" + conflict + "_flowers",
		MirrorAxis.ALL,
		<item:regions_unexplored:${conflict}_flowers>,
		[
			[ <item:regions_unexplored:${conflict}_leaves>, <item:minecraft:air>, <item:regions_unexplored:${conflict}_leaves> ],
			[ <item:minecraft:air>, <item:regions_unexplored:${conflict}_leaves>, <item:minecraft:air> ]
		]
	);
}

// Fix for MCV trapped chests
craftingTable.remove(<item:minecraft:trapped_chest>);
craftingTable.addShapeless(
	"catgirlvillage/trapped_chest",
	<item:minecraft:trapped_chest>,
	[
		<item:minecraft:chest>,
		<item:minecraft:tripwire_hook>
	],
	null
);
