<script lang="ts">
	import { GitFork, Link, Star } from 'lucide-svelte';
	import CommitGraph from './CommitGraph.svelte';
	export let repo: string;

	interface Repo {
		description: string;
		stargazers_count: number;
		name: string;
		forks_count: number;
		homepage?: string;
	};
</script>

<div
	class="mb-0 flex min-h-[12rem] max-w-[30rem] flex-row gap-2 rounded-md border-b-[3px] border-b-mauve bg-mantle p-3 pb-0 pr-0"
>
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
	<section class="ml-3 mt-auto w-1/2">
		<CommitGraph {repo} />
	</section>
</div>
