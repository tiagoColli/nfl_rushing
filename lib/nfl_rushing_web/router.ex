defmodule NflRushingWeb.Router do
  @moduledoc false

  use NflRushingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NflRushingWeb do
    pipe_through :api

    get "/players/stats", StatsController, :index
  end
end
