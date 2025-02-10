<script lang="ts">
	import '../app.css';
	import Navigation from '../components/Navigation.svelte';
	const { children } = $props();
</script>

<svelte:head>
	<title>Spaceness</title>
	<meta
		name="description"
		content="We are a collective of secondary schoolers making open-source software for all."
	/>
</svelte:head>

<div class="mocha m-auto my-10 w-4/5">
	<Navigation />

	{@render children()}
</div>
