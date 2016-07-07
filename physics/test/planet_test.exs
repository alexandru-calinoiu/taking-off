defmodule PlanetTest do
	use ExUnit.Case
	doctest Planet

  test "escape velocity of earth is correct" do
    ev = Planet.escape_velocity(Planet.select[:earth])
    assert ev == 11.2
  end

  test "escape velocity of mars is correct" do
    ev = Planet.escape_velocity(Planet.select[:mars])
    assert ev == 5.1
  end

  test "escape velocity of planet X is correct" do
  	ev = %{mass: 4.0e22, radius: 6.21e6}
  		|> Planet.escape_velocity
  	assert ev == 1.0
  end
end