defmodule RocketryTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "escape velocity of earth is correct" do
		ev = Physics.Rocketry.escape_velocity(:earth)
		assert ev == 11.2
  end

  test "escape velocity of planet X is correct" do
  	ev = %{mass: 4.0e22, radius: 6.21e6}
  		|> Physics.Rocketry.escape_velocity
  	assert ev == 1.0
  end
end
