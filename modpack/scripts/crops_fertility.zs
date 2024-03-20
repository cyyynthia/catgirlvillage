/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

// Leaves crops
<tag:blocks:sereneseasons:summer_crops>.addId(<resource:vinery:apple_leaves>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:apple_leaves>);

<tag:blocks:sereneseasons:summer_crops>.addId(<resource:regions_unexplored:apple_oak_leaves>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:regions_unexplored:apple_oak_leaves>);

<tag:blocks:sereneseasons:summer_crops>.addId(<resource:vinery:cherry_leaves>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:cherry_leaves>);

<tag:items:sereneseasons:summer_crops>.addId(<resource:vinery:apple_leaves>);
<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:apple_leaves>);

<tag:items:sereneseasons:summer_crops>.addId(<resource:regions_unexplored:apple_oak_leaves>);
<tag:items:sereneseasons:autumn_crops>.addId(<resource:regions_unexplored:apple_oak_leaves>);

<tag:items:sereneseasons:summer_crops>.addId(<resource:vinery:cherry_leaves>);
<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:cherry_leaves>);

// Grapes
<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:red_grape_seeds>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:red_grape_bush>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:taiga_grape_seeds_red>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:taiga_grape_bush_red>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:savanna_grape_seeds_red>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:savanna_grape_bush_red>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:jungle_grape_seeds_red>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:jungle_grape_bush_red>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:white_grape_seeds>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:white_grape_bush>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:taiga_grape_seeds_white>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:taiga_grape_bush_white>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:savanna_grape_seeds_white>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:savanna_grape_bush_white>);

<tag:items:sereneseasons:autumn_crops>.addId(<resource:vinery:jungle_grape_seeds_white>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:jungle_grape_bush_white>);

// Vinery stem & lattices
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:vinery:grapevine_stem>);
for lattice in <tag:blocks:vinery:lattice>.idElements() {
	<tag:blocks:sereneseasons:autumn_crops>.addId(lattice);
}

// Croptopia tweaks
<tag:items:sereneseasons:spring_crops>.removeId(<resource:croptopia:tomato_seed>);
<tag:blocks:sereneseasons:spring_crops>.removeId(<resource:croptopia:tomato_crop>);

<tag:items:sereneseasons:spring_crops>.removeId(<resource:croptopia:cabbage_seed>);
<tag:items:sereneseasons:autumn_crops>.addId(<resource:croptopia:cabbage_seed>);
<tag:items:sereneseasons:winter_crops>.addId(<resource:croptopia:cabbage_seed>);
<tag:blocks:sereneseasons:spring_crops>.removeId(<resource:croptopia:cabbage_crop>);
<tag:blocks:sereneseasons:autumn_crops>.addId(<resource:croptopia:cabbage_crop>);
<tag:blocks:sereneseasons:winter_crops>.addId(<resource:croptopia:cabbage_crop>);

<tag:items:sereneseasons:summer_crops>.addId(<resource:croptopia:corn_seed>);
<tag:blocks:sereneseasons:summer_crops>.addId(<resource:croptopia:corn_crop>);
