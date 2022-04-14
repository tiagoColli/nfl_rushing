defmodule NflRushing.Players.StatsFilters do
  @moduledoc """
  Contains the logic to handle filters related to player stats.
  """

  defmodule SearchParams do
    @moduledoc false

    defstruct player_name: nil,
              total_yards: nil,
              longest_rush: nil,
              touchdowns: nil,
              page: 1,
              page_size: 10

    def new(params) do
      struct(__MODULE__, params)
    end
  end

  alias NflRushing.Players.StatsQueries
  alias NflRushing.Repo

  def apply_filters(params, call_type \\ :default) do
    filters = SearchParams.new(params)

    filters
    |> build_query()
    |> run_query({call_type, filters})
  end

  defp build_query(params) do
    base_query = StatsQueries.base()

    params
    |> Enum.reduce(base_query, fn {param, value}, query ->
      handle_filter(query, param, value)
    end)
  end

  defp handle_filter(query, :player_name, value), do: StatsQueries.from_player(query, value)

  defp handle_filter(query, :total_yards, "asc"), do: StatsQueries.order_by_total_yards_asc(query)

  defp handle_filter(query, :total_yards, "desc"),
    do: StatsQueries.order_by_total_yards_desc(query)

  defp handle_filter(query, :longest_rush, "asc"),
    do: StatsQueries.order_by_longest_rush_asc(query)

  defp handle_filter(query, :longest_rush, "desc"),
    do: StatsQueries.order_by_longest_rush_desc(query)

  defp handle_filter(query, :touchdowns, "asc"), do: StatsQueries.order_by_touchdowns_asc(query)

  defp handle_filter(query, :touchdowns, "desc"), do: StatsQueries.order_by_touchdowns_desc(query)

  defp handle_filter(query, _param, _value), do: query

  defp run_query(query, {:paginated, filters}) do
    query
    |> Repo.paginate(page: filters.page, page_size: filters.page_size)
  end

  defp run_query(query, _default), do: Repo.all(query)
end
