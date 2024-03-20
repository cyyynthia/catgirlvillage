/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

var ENDERMAN_OVERHAUL_LIST = [
	<resource:endermanoverhaul:badlands_enderman>,
	<resource:endermanoverhaul:cave_enderman>,
	<resource:endermanoverhaul:crimson_forest_enderman>,
	<resource:endermanoverhaul:dark_oak_enderman>,
	<resource:endermanoverhaul:desert_enderman>,
	<resource:endermanoverhaul:end_enderman>,
	<resource:endermanoverhaul:end_islands_enderman>,
	<resource:endermanoverhaul:flower_fields_enderman>,
	<resource:endermanoverhaul:ice_spikes_enderman>,
	<resource:endermanoverhaul:mushroom_fields_enderman>,
	<resource:endermanoverhaul:nether_wastes_enderman>,
	<resource:endermanoverhaul:coral_enderman>,
	<resource:endermanoverhaul:savanna_enderman>,
	<resource:endermanoverhaul:snowy_enderman>,
	<resource:endermanoverhaul:soulsand_valley_enderman>,
	<resource:endermanoverhaul:swamp_enderman>,
	<resource:endermanoverhaul:warped_forest_enderman>,
	<resource:endermanoverhaul:windswept_hills_enderman>,
];

for creeper in <tag:entity_types:creeperoverhaul:creepers>.idElements() {
	<tag:entity_types:spawnanimations:dig_up_animation>.addId(creeper);
}

for enderman in ENDERMAN_OVERHAUL_LIST {
	<tag:entity_types:spawnanimations:dig_up_animation>.addId(enderman);
}
