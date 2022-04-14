defmodule NflRushing.Players.StatsConverter do
  @moduledoc """
  Contains logic to convert player stats.
  """

  alias NflRushing.Players.Stats

  def from_json(%{
        Player: player_name,
        Team: team_name,
        Pos: player_position,
        Att: rushing_attempts,
        "Att/G": avg_attempts,
        Yds: total_yards,
        Avg: avg_yards_per_attempt,
        "Yds/G": yards_per_game,
        TD: touchdowns,
        Lng: longest_rush,
        "1st": first_downs,
        "1st%": first_down_percent,
        "20+": plus_20_yards,
        "40+": plus_40_yards,
        FUM: rushing_fumbles
      }) do
    %Stats{
      player_name: player_name,
      team_name: team_name,
      player_position: player_position,
      rushing_attempts: rushing_attempts,
      avg_attempts: avg_attempts,
      total_yards: validate_integer(total_yards),
      avg_yards_per_attempt: avg_yards_per_attempt,
      yards_per_game: yards_per_game,
      touchdowns: touchdowns,
      longest_rush: get_longest_rush_distance(longest_rush),
      longest_rush_tuchdown?: longest_rush_is_tuchdown?(longest_rush),
      first_downs: first_downs,
      first_down_percent: first_down_percent,
      plus_20_yards: plus_20_yards,
      plus_40_yards: plus_40_yards,
      rushing_fumbles: rushing_fumbles
    }
  end

  defp validate_integer(number) when is_integer(number), do: number
  defp validate_integer(number), do: String.to_integer(number)

  defp get_longest_rush_distance(longest_rush) do
    longest_rush
    |> String.replace("T", "")
    |> String.to_integer()
  end

  defp longest_rush_is_tuchdown?(longest_rush), do: String.contains?(longest_rush, "T")
end
