defmodule NflRushing.Players.Stats do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @fields ~w(player_name
             team_name
             player_position
             avg_attempts
             rushing_attempts
             total_yards
             avg_yards_per_attempt
             yards_per_game
             touchdowns
             longest_rush
             longest_rush_tuchdown?
             first_downs
             first_down_percent
             plus_20_yards
             plus_40_yards
             rushing_fumbles
            )a

  schema "stats" do
    field :avg_attempts, :float
    field :avg_yards_per_attempt, :float
    field :first_down_percent, :float
    field :first_downs, :integer
    field :longest_rush, :integer
    field :longest_rush_tuchdown?, :boolean, default: false
    field :player_name, :string
    field :player_position, :string
    field :plus_20_yards, :integer
    field :plus_40_yards, :integer
    field :rushing_attempts, :integer
    field :rushing_fumbles, :integer
    field :team_name, :string
    field :total_yards, :integer
    field :touchdowns, :integer
    field :yards_per_game, :integer

    timestamps()
  end

  def changeset(%__MODULE__{} = stats, attrs) do
    stats
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end

  def list_fields, do: @fields
end
