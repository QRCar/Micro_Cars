defmodule QrcarMicroEnterpriseIdentificationWeb.OrganizationsView do
  use QrcarMicroEnterpriseIdentificationWeb, :view
  alias QrcarMicroEnterpriseIdentificationWeb.OrganizationsView

  def render("index.json", %{organizations: organizations}) do
    %{data: render_many(organizations, OrganizationsView, "organizations.json")}
  end

  def render("show.json", %{organizations: organizations}) do
    %{data: render_one(organizations, OrganizationsView, "organizations.json")}
  end

  def render("organizations.json", %{organizations: organizations}) do
    %{id: organizations.id,
      name: organizations.name,
      siren: organizations.siren,
      logo: organizations.logo}
  end
end
