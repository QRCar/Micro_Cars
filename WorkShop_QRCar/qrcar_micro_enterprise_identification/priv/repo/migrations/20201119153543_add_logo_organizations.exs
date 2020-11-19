defmodule QrcarMicroEnterpriseIdentification.Repo.Migrations.AddLogoEstablishment do
  use Ecto.Migration
  def up do
    alter table(:organizations) do
      add_if_not_exists :logo, :string
    end
  end

  def down do
    alter table(:organizations) do
      remove :logo
    end
  end
end
