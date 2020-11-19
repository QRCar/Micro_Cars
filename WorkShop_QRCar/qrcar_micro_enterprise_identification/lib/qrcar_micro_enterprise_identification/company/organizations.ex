defmodule QrcarMicroEnterpriseIdentification.Company.Organizations do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "organizations" do
    field :name, :string
    field :siren, :string
    field :logo, :string
    has_many :establishments, QrcarMicroEnterpriseIdentification.Company.Establishments, foreign_key: :created_by_id

    timestamps()
  end

  @doc false
  def changeset(organizations, attrs) do
    organizations
    |> cast(attrs, [:name, :siren, :logo])
    |> validate_required([:name, :siren])
    |> unique_constraint(:siren)
  end
end
