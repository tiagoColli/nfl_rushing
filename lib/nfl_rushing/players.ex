defmodule NflRushing.Players do
  @moduledoc """
  Contain logic to provide player function to the aplication.
  """

  alias Files.Csv
  alias NflRushing.Players.{Stats, StatsConverter, StatsFilters}
  alias NflRushing.Repo

  def create_player_stats(stats_params) do
    %Stats{}
    |> Stats.changeset(stats_params)
    |> Repo.insert()
  end

  def build_stats_csv(stats) do
    Stats.list_fields()
    |> Csv.build(stats)
  end

  def list_players_status_paginated(params) do
    StatsFilters.apply_filters(params, :paginated)
  end

  defdelegate convert_stats_from_json(json_data), to: StatsConverter, as: :from_json

  defdelegate list_players_status(params), to: StatsFilters, as: :apply_filters
end
