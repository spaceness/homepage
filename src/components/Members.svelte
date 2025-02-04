<script lang="ts">
	const members: {
		name: string;
		href: string;
		pfp: string;
	}[] = [
		{
			name: 'yusof',
			href: 'https://zram.sh',
			pfp: '/profiles/yoofus.png'
		},
		{
			name: 'tgt',
			href: 'https://incognitotgt.me',
			pfp: '/profiles/tgt.png'
		},
		{
			name: 'kas',
			href: 'https://github.com/truekas',
			pfp: 'https://github.com/truekas.png'
		},
		{
			name: 'proudparrot2',
			href: 'https://proudparrot2.com',
			pfp: 'https://github.com/proudparrot2.png'
		}
	];
</script>

<article class="my-10">
	<h1 class="mb-1 text-xl font-bold italic">Members</h1>
	<div class="flex flex-row gap-2">
		{#each members as member}
			<a
				href={member.href}
				class="group flex flex-row items-center rounded-full bg-mantle pr-0 transition-all duration-75 hover:gap-2 hover:pr-2"
			>
				<img src={member.pfp} width="32" alt={`${member.name}'s pfp'`} class="rounded-full" />
				<span class="text-[0px] font-bold transition-all group-hover:text-sm">{member.name}</span>
			</a>
		{/each}
	</div>
</article>
