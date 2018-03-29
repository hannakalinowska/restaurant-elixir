defmodule Cook do
  use Agent

  def start_link(next_handler) do
    Agent.start_link(fn -> next_handler end)
  end

  def handle(pid, order) do
    Agent.cast(pid, fn next_handler -> next_handler.handle(cook(order)); next_handler end)
  end

  def cook(order) do
    IO.inspect("COOK")

    cooking_time = :rand.uniform(3)
    :timer.sleep(cooking_time * 1000)

    order
    |> Map.put(:ingredients, ['Tomatoes'])
    |> Map.put(:cooking_time, cooking_time)
  end
end
