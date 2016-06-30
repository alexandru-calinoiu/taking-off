defmodule Converter do
	def to_meters(miles) when is_integer(miles) do
	miles * 1609.34	
	end

	def convert_to_light_seconds({:miles, miles}) when is_integer(miles) do
		(miles |> to_meters) * 3.335638620368e-9
	end

	def convert_to_light_seconds({:meters, meters}) when is_integer(meters) do
		meters * 3.335638620368e-9
	end
end
