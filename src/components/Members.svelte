<script lang="ts">
	import type { ComponentProps } from 'svelte';
	import MembersCard from './MembersCard.svelte';
	const members: ComponentProps<typeof MembersCard>['member'][] = [
		{
			name: 'yusof',
			href: 'https://zram.sh',
			pfp: '/profiles/yoofus.png'
		},
		{
			name: 'tgt',
			href: 'https://incognitotgt.me',
			pfp: 'https://github.com/incognitotgt.png'
		},
		{
			name: 'proudparrot2',
			href: 'https://proudparrot2.com',
			pfp: 'https://github.com/proudparrot2.png'
		},
		{
			name: 'kas',
			href: 'https://github.com/truekas',
			pfp: 'https://github.com/truekas.png'
		},
		{
			name: 'adigitalmoon',
			href: 'https://discord.com/users/718516822747381852',
			pfp: '/profiles/adigitalmoon.webp'
		},
		{
			name: 'akane',
			href: 'https://github.com/genericness',
			pfp: 'https://github.com/genericness.png'
		},
		{
			name: 'appleflyer',
			href: 'https://appleflyer.xyz',
			pfp: '/profiles/appleflyer.webp'
		},
		{ name: 'port', href: 'https://port22.exposed', pfp: 'https://github.com/port22exposed.png' }
	].sort((a, b) => a.name.localeCompare(b.name));
</script>

<article class="my-4">
	<h1 class="mb-1 text-xl font-bold italic">Members</h1>
	<div class="flex flex-row gap-2">
		{#each members as member}
			<MembersCard {member} />
		{/each}
	</div>
</article>
