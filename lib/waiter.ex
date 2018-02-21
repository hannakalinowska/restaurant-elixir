defmodule Waiter do
  def place_order(food_item) do
    %{}
    |> Order.add_line_item(food_item)
  end
end
