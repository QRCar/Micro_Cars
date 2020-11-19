defmodule QrcarMicroCarIdentificationWeb.CarsController do
  use QrcarMicroCarIdentificationWeb, :controller
  require Logger

  alias QrcarMicroCarIdentification.Vehicle
  alias QrcarMicroCarIdentification.Vehicle.Cars

  action_fallback QrcarMicroCarIdentificationWeb.FallbackController

  def index(conn, _params) do
    cars = Vehicle.list_cars()
    render(conn, "index.json", cars: cars)
  end

  def create(conn, %{"cars" => cars_params}) do
    with {:ok, %Cars{} = cars} <- Vehicle.create_cars(cars_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.cars_path(conn, :show, cars))
      |> render("show.json", cars: cars)
    end
  end

  def show(conn, %{"id" => id}) do
    cars = Vehicle.get_cars!(id)
    render(conn, "show.json", cars: cars)
  end

  def update(conn, %{"id" => id, "cars" => cars_params}) do
    cars = Vehicle.get_cars!(id)

    with {:ok, %Cars{} = cars} <- Vehicle.update_cars(cars, cars_params) do
      render(conn, "show.json", cars: cars)
    end
  end

  def delete(conn, %{"id" => id}) do
    cars = Vehicle.get_cars!(id)

    with {:ok, %Cars{}} <- Vehicle.delete_cars(cars) do
      send_resp(conn, :no_content, "")
    end
  end

  def getCarsByIdUser(conn, %{"user_id" => user_id})do
    cars = Vehicle.get_cars_by_user_id!(user_id)
    render(conn, "index.json", cars: cars)
  end
end
