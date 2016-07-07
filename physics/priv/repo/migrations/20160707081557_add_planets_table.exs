defmodule Physics.Repo.Migrations.AddPlanetsTable do
  use Ecto.Migration

  def change do
  	create table(:planets) do
  		add :mass, :float
  		add :radius, :float
  		add :type, :string
  		add :name, :string
  		timestamps
  	end
  end
end
