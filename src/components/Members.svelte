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
			name: 'kas',
			href: 'https://github.com/truekas',
			pfp: 'https://github.com/truekas.png'
		},
/*
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
*/
		{
			name: 'proudparrot2',
			href: 'https://github.com/proudparrot2',
			pfp: 'https://github.com/proudparrot2.png'
		}
	]
		.sort((a, b) => a.name.localeCompare(b.name))
		.reverse();
</script>

<article class="my-4">
	<h1 class="mb-1 text-xl font-bold italic">Members</h1>
	<div class="flex flex-row gap-2">
		{#each members as member}
			<MembersCard {member} />
		{/each}
	</div>
</article>
