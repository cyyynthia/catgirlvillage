/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import { readFileSync, writeFileSync } from 'fs'
import { parse } from 'smol-toml'

const MODLIST_START = '<!-- GENERATED MOD LIST START -->'
const MODLIST_END = '<!-- GENERATED MOD LIST END -->'

const LEGAL_START = '<!-- GENERATED PERMISSION LIST START -->'
const LEGAL_END = '<!-- GENERATED PERMISSION LIST END -->'

const README = new URL('../README.md', import.meta.url)
const META = new URL('../modpack/meta.toml', import.meta.url)

const CATEGORIES = [
	{ id: 'worldgen', name: 'World generation, exploration & adventure' },
	{ id: 'environment', name: 'Environment & gameplay' },
	{ id: 'villagers', name: 'Villagers' },
	{ id: 'nature', name: 'Nature' },
	{ id: 'mobs', name: 'Mobs' },
	{ id: 'create', name: 'Create & addons' },
	{ id: 'decoration', name: 'Decoration & cosmetics' },
	{ id: 'utilities', name: 'Miscellaneous & utilities' },
	{ id: 'performance', name: 'Performance & patches' },
	{ id: 'nerfs', name: 'Nerfs' },
	{ id: 'server', name: 'Server specific' },
	{ id: 'modpack', name: 'Modpack management utilities' },
	{ id: 'api', name: 'API mods' },
]

const data = parse(readFileSync(META, 'utf8'))
const mods = {}

for (const k in data) {
	if (k in data) {
		const mod = data[k]
		mods[mod.category] = mods[mod.category] || []
		mods[mod.category].push(mod)
	}
}

let modlist = ''
let permissions = ''

for (const category of CATEGORIES) {
	modlist += '\n'
	modlist += `#### ${category.name}\n`
	for (const mod of mods[category.id]) {
		modlist += `- [${mod.name}](${mod.url})`
		if (mod.description) modlist += ` - ${mod.description}`
		modlist += '\n'

		if (mod.permission) {
			permissions += `- ${mod.url}: ${mod.permission}\n`
		}
	}
}

const readme = readFileSync(README, 'utf8')

const startModlist = readme.indexOf(MODLIST_START) + MODLIST_START.length
const endModlist = readme.indexOf(MODLIST_END)

const startLegal = readme.indexOf(LEGAL_START) + LEGAL_START.length
const endLegal = readme.indexOf(LEGAL_END)

const generated =
	readme.slice(0, startModlist) +
	modlist +
	readme.slice(endModlist, startLegal) +
	'\n' + permissions +
	readme.slice(endLegal)

writeFileSync(README, generated)
