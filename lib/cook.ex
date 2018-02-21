defmodule Cook do
  def handle(order) do
    cooking_time = :rand.uniform(3)
    :timer.sleep(cooking_time * 1000)

    order
    |> Map.put(:ingredients, ['Tomatoes'])
    |> Map.put(:cooking_time, cooking_time)
  end
end
