defmodule DictatorDemo.Repo do
  use Ecto.Repo,
    otp_app: :dictator_demo,
    adapter: Ecto.Adapters.Postgres
end
