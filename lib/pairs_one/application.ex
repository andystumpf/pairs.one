defmodule PairsOne.Application do
  @moduledoc """
  Generated by Phoenix. Starts the supervisors.
  """
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    # Define workers and child supervisors to be supervised
    children = [
      {Phoenix.PubSub, name: PairsOne.PubSub},
      PairsOneWeb.Presence,
      # {PairsOne.RedisRepo, "redis://localhost:6379/0"},
      {PairsOne.RedisRepo, System.get_env("REDIS_URI") || "redis://localhost:6379/0"},
      PairsOne.PendingGames,
      PairsOneWeb.Endpoint
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PairsOne.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PairsOneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
