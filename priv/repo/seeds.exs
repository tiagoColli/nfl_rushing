# Seed file to fill the DB with the given products.json

json_path = "#{__DIR__}/data/rushing.json"

with {:ok, body} <- File.read(json_path),
     {:ok, json} <- Jason.decode(body, keys: :atoms) do
  json
  |> Enum.with_index()
  |> Enum.reduce(Ecto.Multi.new(), fn {stats_item, index}, multi ->
    IO.inspect(stats_item)

    stats = NflRushing.Players.convert_stats_from_json(stats_item)

    Ecto.Multi.insert(multi, :"#{index}#{stats.player_name}", stats)
  end)
  |> NflRushing.Repo.transaction()
else
  err -> err
end
