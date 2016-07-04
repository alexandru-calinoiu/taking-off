defmodule ConverterTest do
  use ExUnit.Case
  doctest Converter

  test "to nearest tenth is correct" do
  	actual_value = 3.1415 |> Converter.to_nearest_tenth
  	assert actual_value == 3.2
  end

  test "to meters" do
    actual_value = 2 |> Converter.to_meters
    assert actual_value == 2000  
  end

  test "to km" do
  	actual_value = 2000 |> Converter.to_km
  	assert actual_value == 2
  end

  test "seconds to hours" do
    assert 2 == Converter.seconds_to_hours(120)
  end

  test "seconds to hours when not divisible" do
    assert 0.5 == Converter.seconds_to_hours(30)
  end

  test "to_light_seconds with miles works" do
  	actual_value = {:miles, 5.1e10} |> Converter.to_light_seconds
  	assert actual_value == 273777.69
  end
end