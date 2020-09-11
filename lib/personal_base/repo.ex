defmodule PersonalBase.Repo do
  use Ecto.Repo,
    otp_app: :personal_base,
    adapter: Ecto.Adapters.Postgres
end
