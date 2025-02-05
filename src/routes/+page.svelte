<script>
	import Members from '../components/Members.svelte';
	import Repo from '../components/Repo.svelte';
</script>

<div>
	<article>
		<h1 class="text-2xl">👋🏻 this is Spaceness.</h1>
		<p>We are a collective of secondary schoolers making open-source software for all.</p>
	</article>
	<Members />
	<article class="my-4">
		<h1 class="mb-1 text-xl font-bold italic">Repositories</h1>
		<div class="flex flex-row flex-wrap gap-2">
			<Repo repo="stardust" />
			<Repo repo="starlight" />
			<Repo repo="peersocket" />
		</div>
	</article>
</div>
