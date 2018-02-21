defmodule AssistantManager do
  def handle(order) do
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
