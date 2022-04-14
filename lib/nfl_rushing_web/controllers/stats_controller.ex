defmodule NflRushingWeb.StatsController do
  @doc """
  Contains logic to handle http calls related to player stats.
  """

  use NflRushingWeb, :controller

  alias NflRushing.Players

  def index(conn, params) do
    fetch_data_and_build_response(conn, params)
  end

  defp fetch_data_and_build_response(conn, params) do
    case List.keyfind(conn.req_headers, "accept", 0) do
      {"accept", "text/csv"} ->
        params
        |> Players.list_players_status()
        |> csv_request(conn)

      _default ->
        params
        |> Players.list_players_status_paginated()
        |> json_request(conn)
    end
  end

  defp json_request(data, conn) do
    conn
    |> put_status(:ok)
    |> json(data)
  end

  defp csv_request(data, conn) do
    csv_data = Players.build_stats_csv(data)

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=players_stats.csv")
    |> send_resp(200, csv_data)
  end
end
