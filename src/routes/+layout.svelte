<script lang="ts">
	import '../app.css';
	import Navigation from '../components/Navigation.svelte';
	const { children } = $props();
</script>

<svelte:head>
	<title>Spaceness</title>
</svelte:head>

<div class="mocha m-auto my-10 w-4/5">
	<Navigation />

	{@render children()}
</div>
