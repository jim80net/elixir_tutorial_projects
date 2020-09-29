defmodule HelloTest.Repo do
  use Ecto.Repo,
    otp_app: :hello_test,
    adapter: Ecto.Adapters.Postgres
end
