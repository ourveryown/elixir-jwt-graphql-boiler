defmodule MyApi.Repo do
  use Ecto.Repo,
    otp_app: :my_api,
    adapter: Ecto.Adapters.Postgres
end
