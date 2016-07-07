defmodule SolarTest do
	use ExUnit.Case
	use Timex

	import Solar

	doctest Solar

	setup do
		flares = [
			%{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
			%{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
			%{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
			%{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
			%{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
			%{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
			%{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
			%{classification: :X, scale: 45, date: Date.from({2003, 11, 4})}
		]
		{:ok, data: flares}
	end

	test "We have 8 solar flares", %{data: flares} do
		assert length(flares) == 8
	end

	test "power for classification X" do
		assert %{classification: :X, scale: 99} |> power == 9900
	end

	test "power for classification M" do
		assert %{classification: :M, scale: 5.8} |> power == 58
	end

	test "power for classification C" do
		assert %{classification: :C, scale: 2.5} |> power == 2.5
	end

	test "no_eva", %{data: flares} do
		assert length(flares |> no_eva) == 3
	end

	test "deadliest returns the max", %{data: flares} do
		assert flares |> deadliest == 9900
	end

	test "count_flares works", %{data: flares} do
		assert count_flares(flares) == 8
	end

	test "total_flare_power works", %{data: flares} do
		assert total_flare_power(flares) == 15525.966
	end

	test "total_flare_power_lib works", %{data: flares} do
		assert total_flare_power_lib(flares) == 22511.7
	end

	test "total_flare_power_comprehension works", %{data: flares} do
		assert total_flare_power_comprehension(flares) == 22511.7
	end

	test "flare_list marks the deadly flares", %{data: flares} do
		Solar.flare_list(flares)
	end
end