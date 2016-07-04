defmodule Physics.Rocketry do
	import Converter
	import Calcs
	import Planets
	import Physics.Laws

	def escape_velocity(:mars), do: moon |> escape_velocity		

	def escape_velocity(:moon), do: mars |> escape_velocity

	def escape_velocity(:earth), do: earth |> escape_velocity

	def escape_velocity(planet) when is_map(planet) do
		planet 
			|> calculate_escape 
			|> to_km
			|> to_nearest_tenth
	end

	def orbital_speed(height) do
		newtons_gravitational_constant * earth.mass / orbital_radius(height)
			|> square_root
	end

	def orbital_acceleration(height) do
		(orbital_speed(height) |> squared) / orbital_radius(height)
	end

	def obital_duration(height) do
		4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / (
			newtons_gravitational_constant * earth.mass)
			|> square_root
			|> seconds_to_hours
	end

	def orbital_height(duration) do
		newtons_gravitational_constant * earth.mass * 
		(duration |> squared) / (
			4 * (:math.pi |> squared))
			|> cube_root
			|> to_km
	end

	defp orbital_radius(height) do
		earth.radius + (height |> to_meters)
	end

	defp calculate_escape(%{mass: mass, radius: radius}) do
		2 * newtons_gravitational_constant * mass / radius
			|> square_root
	end
end
