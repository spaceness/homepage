<script lang="ts">
	import { SiDiscord, SiGithub } from '@icons-pack/svelte-simple-icons';

	const socials = [
		{
			name: 'Discord',
			href: 'https://discord.gg/t4JFcg52xv',
			Icon: SiDiscord
		},
		{
			name: 'Github',
			href: 'https://github.com/spaceness',
			Icon: SiGithub
		}
	];
</script>

<div
	class="nav mb-4 flex flex-row items-center justify-between gap-3 rounded-md border-b-[3px] border-b-text p-3 pb-3"
>
	<div class="flex flex-row">
		<a href="/" class="transition-all duration-75 hover:scale-105">
			<img src="/spaceness.png" width="182" alt="Spaceness logo" />
		</a>
	</div>
	<hr class="w-full rounded-full border-[2px] border-text" />
	<div class="flex flex-row gap-2">
		{#each socials as social}
			<a href={social.href}>
				<social.Icon size={24} />
			</a>
		{/each}
	</div>
</div>

<style>
	.nav {
		box-shadow: 0 10px 30px 0px rgba(205, 214, 244, 0.1);
	}
</style>
