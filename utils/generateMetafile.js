/*!
 * Copyright (c) Cynthia Rey, All rights reserved.
 * SPDX-License-Identifier: MPL-2.0
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

import { readFileSync, writeFileSync } from 'fs'
import { parse, stringify } from 'smol-toml'

function getUrl (slug, file) {
	const { update } = parse(readFileSync(new URL(file, MODPACK_BASE), 'utf8'))
	if (update?.modrinth) {
		return fetch(`https://api.modrinth.com/v2/project/${update.modrinth['mod-id']}`)
			.then((r) => r.json())
			.then((r) => `https://modrinth.com/${r.project_type}/${r.slug}`)
	}

	return `https://www.curseforge.com/minecraft/mc-mods/${slug}`
}

const MODPACK_BASE = new URL('../modpack/', import.meta.url)

const meta = parse(readFileSync(new URL('./meta.toml', MODPACK_BASE), 'utf8'))
const seen = new Set(Object.keys(meta))

const index = parse(readFileSync(new URL('./index.toml', MODPACK_BASE), 'utf8'))

for (const { file } of index.files) {
	if (file.startsWith('mods/') && file.endsWith('.pw.toml')) {
		const slug = file.slice(5, -8)
		if (!meta[slug]) {
			meta[slug] = {
				name: parse(readFileSync(new URL(file, MODPACK_BASE), 'utf8')).name,
				category: '',
				description: '',
				url: await getUrl(slug, file),
			}
		} else {
			seen.delete(slug)
		}
	}
}

for (const s of seen) delete meta[s]

writeFileSync(
	new URL('./meta.toml', MODPACK_BASE),
	stringify(Object.keys(meta).sort().reduce((acc, k) => ((acc[k] = meta[k]), acc), {}))
)
