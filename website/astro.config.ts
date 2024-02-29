import { defineConfig } from 'astro/config'

export default defineConfig({
	site: 'https://catgirlvillage.maid.gg/',
	vite: {
		build: {
			// I don't like inlined assets
			assetsInlineLimit: 0,
		},
	},
})
