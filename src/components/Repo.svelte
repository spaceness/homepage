<script lang="ts">
	import { GitFork, Link, Star } from 'lucide-svelte';
	import CommitGraph from './CommitGraph.svelte';
	export let repo: string;
</script>

<div class="flex min-h-[12rem] max-w-[30rem] flex-row gap-2 rounded-md bg-mantle p-4">
	<section>
		{#await fetch(`https://api.github.com/repos/spaceness/${repo}`).then( (res) => res.json() ) then data}
			<a
				class="text-lg font-bold text-mauve underline"
				href={`https://github.com/spaceness/${repo}`}>{data.name}</a
			>
			<p>{data.description}</p>
			<a
				class="flex flex-row items-center gap-2 font-medium text-blue duration-300 hover:text-teal active:text-red"
				href={`https://github.com/spaceness/${repo}/stargazers`}
			>
				<Star class="size-4" />
				{data.stargazers_count}
			</a>
			<a
				class="flex flex-row items-center gap-2 font-medium text-blue duration-300 hover:text-teal active:text-red"
				href={`https://github.com/spaceness/${repo}/forks`}
			>
				<GitFork class="size-4" />
				{data.forks_count}
			</a>
			{#if data.homepage}
				<a
					class="flex flex-row items-center gap-2 truncate font-medium text-blue duration-300 hover:text-teal active:text-red"
					href={data.homepage}
				>
					<Link class="size-4" />
					{data.homepage.split('//')[1]}
				</a>
			{/if}
		{:catch}
			<p>Error loading repository information</p>
		{/await}
	</section>
	<section class="w-1/2">
		<CommitGraph {repo} />
	</section>
</div>
