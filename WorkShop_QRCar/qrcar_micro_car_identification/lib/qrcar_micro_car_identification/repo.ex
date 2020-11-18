defmodule QrcarMicroCarIdentification.Repo do
  use Ecto.Repo,
    otp_app: :qrcar_micro_car_identification,
    adapter: Ecto.Adapters.Postgres
end
