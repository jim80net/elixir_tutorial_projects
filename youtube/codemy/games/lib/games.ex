defmodule Games do  
  # alias Games.Entities.Game

  @db_path "games.bin"


  def all, do: all_games()
  def all_games, do: load_or_create()

  def add(%Games.Entities.Game{id: nil} = game) do
    game_with_id = struct(game, %{id: last_id() + 1})
    new_list = [game_with_id | all_games()]
    File.write!(@db_path, :erlang.term_to_binary(new_list))
    new_list
  end
  
  def add(%{} = game) do
    keys = %Games.Entities.Game{} |> Map.from_struct |> Map.keys 
    processed_map = 
      for key <- keys, into: %{} do
        value = Map.get(game, key) || Map.get(game, to_string(key))
        {key, value}
      end
    a_struct = Map.merge(%Games.Entities.Game{}, processed_map)
    add(a_struct)
  end

  defp last_id do
    if all_games() == [] do
      0
    else
      all_games()
      |> Enum.max_by( fn game -> game.id end)
      |> Map.get(:id)
    end
  end

  defp load_or_create do
    if File.exists?(@db_path) do
      File.read!(@db_path) 
        |> :erlang.binary_to_term
    else
      starting_value = []
      File.write!(@db_path, :erlang.term_to_binary(starting_value))
      starting_value
    end
  end
end
