defmodule QrcarMicroCarIdentification.Vehicle.Cars do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cars" do
    field :license, :string
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(cars, attrs) do
    cars
    |> cast(attrs, [:license, :user_id])
    |> validate_required([:license, :user_id])
  end
end
