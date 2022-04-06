defmodule NflRushing.Repo.Migrations.CreateStats do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:stats) do
      add :player_name, :string, null: false
      add :team_name, :string, null: false
      add :player_position, :string, null: false
      add :avg_attempts, :float, null: false
      add :rushing_attempts, :integer, null: false
      add :total_yards, :integer, null: false
      add :avg_yards_per_attempt, :float, null: false
      add :yards_per_game, :integer, null: false
      add :touchdowns, :integer, null: false
      add :longest_rush, :integer, null: false
      add :longest_rush_tuchdown?, :boolean, default: false, null: false
      add :first_downs, :integer, null: false
      add :first_down_percent, :float, null: false
      add :plus_20_yards, :integer, null: false
      add :plus_40_yards, :integer, null: false
      add :rushing_fumbles, :integer, null: false

      timestamps()
    end
  end
end
