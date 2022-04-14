defmodule Files.Csv do
  @moduledoc """
  Contains logic to handle csv files.
  """

  def build(headers, data) do
    data
    |> CSV.encode(headers: headers)
    |> Enum.to_list()
    |> to_string()
  end
end
