<script lang="ts">
	export let repo: string;
	import { onMount } from 'svelte';
	import { Chart, registerables } from 'chart.js';
	Chart.register(...registerables);

	let chartCanvas: HTMLCanvasElement;

	const fetchCommits = async () => {
		const response = await fetch(
			`https://api.github.com/repos/spaceness/${repo}/commits?per_page=100`
		);
		const commits = await response.json();

		// Process commits into a daily count
		const counts: Record<string, number> = {};
		for (const commit of commits) {
			const date = commit.commit.author.date.split('T')[0];
			counts[date] = (counts[date] || 0) + 1;
		}

		return Object.entries(counts)
			.map(([date, count]) => ({
				date,
				count
			}))
			.sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime());
	};

	onMount(async () => {
		const commitsData = await fetchCommits();

		new Chart(chartCanvas, {
			type: 'line',
			data: {
				labels: commitsData.map((d) => d.date),
				datasets: [
					{
						data: commitsData.map((d) => d.count),
						borderColor: '#cba6f7',
						borderWidth: 2,
						fill: true,
						pointRadius: 0
					}
				]
			},
			options: {
				scales: {
					x: { display: false },
					y: { display: false }
				},
				plugins: {
					legend: { display: false },

					tooltip: { enabled: false }
				}
			}
		});
	});
</script>

<canvas bind:this={chartCanvas}></canvas>
