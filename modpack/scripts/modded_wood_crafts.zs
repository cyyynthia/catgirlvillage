/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

// Get rid of some pesky conflicts
craftingTable.remove(<item:minecraft:bookshelf>);

// These are missing from Forge's planks tag
<tag:items:forge:planks>.addId(<resource:vinery:cherry_planks>);
<tag:items:forge:planks>.addId(<resource:betterarcheology:rotten_planks>);

// Crafting recipes
craftingTable.addShaped(
	"catgirlvillage/modded_wood_chests",
	<item:minecraft:chest>,
	[
		[ <tag:items:forge:planks>, <tag:items:forge:planks>, <tag:items:forge:planks>, ],
		[ <tag:items:forge:planks>, <item:minecraft:air>, <tag:items:forge:planks>, ],
		[ <tag:items:forge:planks>, <tag:items:forge:planks>, <tag:items:forge:planks>, ],
	],
	null
);

craftingTable.addShaped(
	"catgirlvillage/modded_crafting_tables",
	<item:minecraft:crafting_table>,
	[
		[ <tag:items:forge:planks>, <tag:items:forge:planks>, ],
		[ <tag:items:forge:planks>, <tag:items:forge:planks>, ],
	],
	null
);

craftingTable.addShaped(
	"catgirlvillage/modded_bookshelves",
	<item:minecraft:chest>,
	[
		[ <tag:items:forge:planks>, <tag:items:forge:planks>, <tag:items:forge:planks>, ],
		[ <item:minecraft:book>, <item:minecraft:book>, <item:minecraft:book>, ],
		[ <tag:items:forge:planks>, <tag:items:forge:planks>, <tag:items:forge:planks>, ],
	],
	null
);
