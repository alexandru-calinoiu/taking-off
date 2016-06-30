defmodule Physics.Planet do
	defstruct [
		name: "Earth",
		radius_m: 6.371e6,
		mass_kg: 5.97e24 
	]

	def escape_velocity(planet) do
		g = 6.67e-11
		gmr = 2 * g * planet.mass_kg/planet.radius_m

		vms = :math.sqrt gmr
		vkms = vms / 1000
		Float.ceil vkms, 1
	end		
end

v = %Physics.Planet{} |> Physics.Planet.escape_velocity

defmodule Physics.Rocketry do
	
end
