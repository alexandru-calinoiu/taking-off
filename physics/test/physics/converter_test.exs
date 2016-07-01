defmodule ConverterTest do
  use ExUnit.Case
  doctest Physics.Converter

  test "to nearest tenth is correct" do
  	actual_value = 3.1415 |> Physics.Converter.to_nearest_tenth
  	assert actual_value == 3.2
  end

  test "to km" do
  	actual_value = {:meters, 2000} |> Physics.Converter.to_km
  	assert actual_value == 2
  end

  test "to_light_seconds with miles works" do
  	actual_value = {:miles, 5.1e10} |> Physics.Converter.to_light_seconds
  	assert actual_value == 273777
  end
end