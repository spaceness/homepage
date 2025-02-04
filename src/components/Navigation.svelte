<script lang="ts">
	import { siDiscord, siGithub, type SimpleIcon } from 'simple-icons';

	const socials: {
		name: string;
		href: string;
		icon: SimpleIcon;
	}[] = [
		{
			name: 'Discord',
			href: 'https://discord.gg/t4JFcg52xv',
			icon: siDiscord
		},
		{
			name: 'Github',
			href: 'https://github.com/spaceness',
			icon: siGithub
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
				{@html social.icon.svg.replace(
					`role="img"`,
					`role="img" width="24" height="24" class="social" fill="#cdd6f4"`
				)}
			</a>
		{/each}
	</div>
</div>

<style>
	.nav {
		box-shadow: 0 10px 30px 0px rgba(255, 255, 255, 0.1);
	}
</style>
