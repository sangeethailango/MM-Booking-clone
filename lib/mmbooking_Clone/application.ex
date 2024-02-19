defmodule Mmbooking_Clone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Mmbooking_CloneWeb.Telemetry,
      # Start the Ecto repository
      Mmbooking_Clone.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mmbooking_Clone.PubSub},
      # Start Finch
      {Finch, name: Mmbooking_Clone.Finch},
      # Start the Endpoint (http/https)
      Mmbooking_CloneWeb.Endpoint
      # Start a worker by calling: Mmbooking_Clone.Worker.start_link(arg)
      # {Mmbooking_Clone.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mmbooking_Clone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Mmbooking_CloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
