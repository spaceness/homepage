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

<img
	src="/icon.svg"
	alt="background"
	width="364"
	class="absolute -bottom-2 -right-10 -z-20 opacity-25"
/>

<div class="mocha m-auto my-10 w-4/5">
	<Navigation />

	{@render children()}
</div>
