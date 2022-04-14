defmodule NflRushing.Players.StatsQueries do
  @moduledoc """
  Contains logic to provide composable queries related to player stats.
  """

  import Ecto.Query

  alias NflRushing.Players.Stats

  def base, do: from(_ in Stats, as: :stats)

  def from_player(query \\ base(), player_name) do
    query
    |> where([stats: stats], stats.player_name > ^player_name)
  end

  def order_by_total_yards_asc(query \\ base()), do: order_by(query, asc: :total_yards)

  def order_by_total_yards_desc(query \\ base()), do: order_by(query, desc: :total_yards)

  def order_by_longest_rush_asc(query \\ base()), do: order_by(query, asc: :longest_rush)

  def order_by_longest_rush_desc(query \\ base()), do: order_by(query, desc: :longest_rush)

  def order_by_touchdowns_asc(query \\ base()), do: order_by(query, asc: :touchdowns)

  def order_by_touchdowns_desc(query \\ base()), do: order_by(query, desc: :touchdowns)
end
