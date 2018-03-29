defmodule AssistantManager do
  use Agent

  def start_link(next_handler) do
    Agent.start_link(fn -> next_handler end, name: __MODULE__)
  end

  def handle(order) do
    Agent.cast(__MODULE__, fn next_handler -> next_handler.handle(price(order)); next_handler end)
  end

  def price(order) do
    IO.inspect("ASSISTANT MANAGER")

    :timer.sleep(1000)

    order
    |> Map.get_and_update(:line_items, fn(current_value) ->
      new_value = Enum.map(current_value, fn(line_item) ->
        price = :rand.uniform(10)
        Order.update_line_item(line_item, price)
      end)
      {current_value, new_value}
    end)
    |> elem(1)
  end
end
