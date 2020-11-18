defmodule QrcarMicroCarIdentification.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :license, :string
      add :user_id, :uuid

      timestamps()
    end

  end
end
