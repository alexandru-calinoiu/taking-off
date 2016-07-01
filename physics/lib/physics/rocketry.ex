defmodule Physics.Rocketry do
	def escape_velocity(:earth) do
		%{mass: 5.972e24, radius: 6.371e6}
			|> escape_velocity	
	end

	def escape_velocity(planet) when is_map(planet) do
		planet 
			|> calculate_escape 
			|> Physics.Converter.to_km
			|> Physics.Converter.to_nearest_tenth
	end

	defp calculate_escape(%{mass: mass, radius: radius}) do
		newtons_constant = 6.67e-11
		meters = 2 * newtons_constant * mass / radius
			|> :math.sqrt
		{:meters, meters}
	end
end
