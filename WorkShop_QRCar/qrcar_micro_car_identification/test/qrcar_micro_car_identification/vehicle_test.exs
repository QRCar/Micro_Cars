defmodule QrcarMicroCarIdentification.VehicleTest do
  use QrcarMicroCarIdentification.DataCase

  alias QrcarMicroCarIdentification.Vehicle

  describe "cars" do
    alias QrcarMicroCarIdentification.Vehicle.Cars

    @valid_attrs %{license: "some license", user_id: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{license: "some updated license", user_id: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{license: nil, user_id: nil}

    def cars_fixture(attrs \\ %{}) do
      {:ok, cars} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vehicle.create_cars()

      cars
    end

    test "list_cars/0 returns all cars" do
      cars = cars_fixture()
      assert Vehicle.list_cars() == [cars]
    end

    test "get_cars!/1 returns the cars with given id" do
      cars = cars_fixture()
      assert Vehicle.get_cars!(cars.id) == cars
    end

    test "create_cars/1 with valid data creates a cars" do
      assert {:ok, %Cars{} = cars} = Vehicle.create_cars(@valid_attrs)
      assert cars.license == "some license"
      assert cars.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_cars/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehicle.create_cars(@invalid_attrs)
    end

    test "update_cars/2 with valid data updates the cars" do
      cars = cars_fixture()
      assert {:ok, %Cars{} = cars} = Vehicle.update_cars(cars, @update_attrs)
      assert cars.license == "some updated license"
      assert cars.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_cars/2 with invalid data returns error changeset" do
      cars = cars_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehicle.update_cars(cars, @invalid_attrs)
      assert cars == Vehicle.get_cars!(cars.id)
    end

    test "delete_cars/1 deletes the cars" do
      cars = cars_fixture()
      assert {:ok, %Cars{}} = Vehicle.delete_cars(cars)
      assert_raise Ecto.NoResultsError, fn -> Vehicle.get_cars!(cars.id) end
    end

    test "change_cars/1 returns a cars changeset" do
      cars = cars_fixture()
      assert %Ecto.Changeset{} = Vehicle.change_cars(cars)
    end
  end
end
