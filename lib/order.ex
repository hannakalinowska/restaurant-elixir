defmodule Order do
  def add_line_item(order, name, quantity \\ 1) do
    {_current_value, new_order} = Map.get_and_update(order, :line_items, fn(current_value) ->
      {current_value, (current_value || []) ++ [%{name: name, quantity: quantity}]}
    end)
    new_order
  end

  def update_line_item(line_item, price) do
    Map.put(line_item, :price, price)
  end

  def pay(order) do
    Map.put(order, :paid, true)
  end
end
