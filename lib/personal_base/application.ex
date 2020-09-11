defmodule PersonalBase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      PersonalBase.EventApp,
      # Start the Ecto repository
      PersonalBase.Repo,
      # Start the Telemetry supervisor
      PersonalBaseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PersonalBase.PubSub},
      # Start the Endpoint (http/https)
      PersonalBaseWeb.Endpoint
      # Start a worker by calling: PersonalBase.Worker.start_link(arg)
      # {PersonalBase.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PersonalBase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PersonalBaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
