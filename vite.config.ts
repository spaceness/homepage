import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
  plugins: [sveltekit()],
  server: {
    allowedHosts: ['.ts.net']
  },
  ssr: {
    noExternal: ["@icons-pack/svelte-simple-icons"]
  }
});
