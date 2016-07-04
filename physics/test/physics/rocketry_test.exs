defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of earth is correct" do
    ev = Physics.Rocketry.escape_velocity(:earth)
    assert ev == 11.2
  end

  test "escape velocity of mars is correct" do
    ev = Physics.Rocketry.escape_velocity(:mars)
    assert ev == 5.1
  end

  test "escape velocity of moon is correct" do
		ev = Physics.Rocketry.escape_velocity(:moon)
		assert ev == 2.4
  end

  test "escape velocity of planet X is correct" do
  	ev = %{mass: 4.0e22, radius: 6.21e6}
  		|> Physics.Rocketry.escape_velocity
  	assert ev == 1.0
  end

  test "orbital duration for 100km" do
    term = Physics.Rocketry.obital_duration(58.89)
    term |> IO.inspect
    assert 4 > term && term < 5
  end

  test "orbital height for 4 hours" do
    Physics.Rocketry.orbital_height(4) |> IO.inspect
  end

  test "orbital acceleration" do
    assert Physics.Rocketry.orbital_acceleration(100) == 9.512678810620692
  end
end
