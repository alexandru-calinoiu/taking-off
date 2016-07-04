defmodule Converter do
	def to_nearest_tenth(val) do
		Float.ceil(val, 1)
	end

	def to_meters(km) do
		km * 1000	
	end

	def to_km(meters) do
		meters / 1000
	end

	def seconds_to_hours(seconds) do
		seconds / 60
	end

	def hours_to_seconds(hours) do
		hours * 60
	end

	def to_light_seconds({:miles, miles}) do
		(miles * 5.36819e-6) |> round_to
	end

	def to_light_seconds({:meters, meters}) do
		(meters * 3.335638620368e-9) |> round_to
	end

	defp round_to(val, precision \\ 5) when is_float(val), do: Float.round(val, precision) 
end