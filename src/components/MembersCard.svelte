<script lang="ts">
	export let member: {
		name: string;
		href: string;
		pfp: string;
	};
</script>

<a
	href={member.href}
	class="group flex flex-row items-center rounded-full bg-mantle pr-0 transition-all duration-75 hover:gap-2 hover:pr-2"
>
	<img src={member.pfp} width="32" alt={`${member.name}'s pfp'`} class="rounded-full" />
	<span class="text-[0px] font-bold transition-all group-hover:text-sm">{member.name}</span>
</a>
