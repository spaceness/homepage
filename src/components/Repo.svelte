<script lang="ts">
	import CommitGraph from './CommitGraph.svelte';
	export let repo: string;
</script>

<div class="flex w-[500px] flex-row gap-2 rounded-md bg-mantle p-4">
	<section>
		{#await fetch(`https://api.github.com/repos/spaceness/${repo}`).then( (res) => res.json() ) then data}
			<a
				class="text-lg font-bold text-mauve underline"
				href={`https://github.com/spaceness/${repo}`}>{data.name}</a
			>
			<p>{data.description}</p>
			<p>☆ {data.stargazers_count}</p>
		{:catch}
			<p>Error loading repository information</p>
		{/await}
	</section>
	<section class="w-1/2">
		<CommitGraph {repo} />
	</section>
</div>
