defmodule Solar do
	def power(%{classification: :X, scale: s}), do: s * 100
	def power(%{classification: :M, scale: s}), do: s * 10
	def power(%{classification: :C, scale: s}), do: s * 1

	def no_eva(flares) do
		Enum.filter flares, &(power(&1) > 1000)
	end

	def deadliest(flares) do
		Enum.map(flares, &(power(&1))) |> Enum.max
	end

	def total_flare_power(flares), do: total_flare_power(flares, 0)
	def total_flare_power([%{classification: :M} = head | tail], total) do
		total_flare_power(tail, total + power(head) * 0.92) 
	end
	def total_flare_power([%{classification: :C} = head | tail], total) do
		total_flare_power(tail, total + power(head) * 0.78) 
	end
	def total_flare_power([%{classification: :X} = head | tail], total) do
		total_flare_power(tail, total + power(head) * 0.68) 
	end
	def total_flare_power([], total), do: total

	def total_flare_power_lib(flares) do
		Enum.reduce flares, 0, fn(flare, total) -> 
			power(flare) + total
		end
	end

	def total_flare_power_comprehension(flares) do
		(for flare <- flares, do: power(flare)) |> Enum.sum
	end

	def flare_list(flares) do
		for flare <- flares,
			power <- [power(flare)],
			is_deadly <- [power > 1000], 
			do: %{power: power, is_deadly: is_deadly}
	end

	def count_flares(flares), do: count_flares(flares, 0)
	def count_flares([_head | tail], count), do: count_flares(tail, count + 1) 
	def count_flares([], count), do: count
end