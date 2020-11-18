defmodule QrcarMicroCarIdentificationWeb.CarsView do
  use QrcarMicroCarIdentificationWeb, :view
  alias QrcarMicroCarIdentificationWeb.CarsView

  def render("index.json", %{cars: cars}) do
    %{data: render_many(cars, CarsView, "cars.json")}
  end

  def render("show.json", %{cars: cars}) do
    %{data: render_one(cars, CarsView, "cars.json")}
  end

  def render("cars.json", %{cars: cars}) do
    %{id: cars.id,
      license: cars.license,
      user_id: cars.user_id}
  end
end
