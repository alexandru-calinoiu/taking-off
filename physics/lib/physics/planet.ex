defmodule Physics.Planet do
	use Ecto.Schema

	schema "planets" do
		field :mass, :float
		field :radius, :float
		field :type, :string
		field :name, :string
		timestamps
	end
end