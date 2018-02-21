defmodule Cashier do
  def handle(order, agent) do
    Agent.update(agent, fn(orders) -> [order | orders] end)
    order
  end

  def pay_outstanding_orders(agent) do
    orders = Agent.get(agent, fn(orders) -> orders end)
    Enum.map(orders, fn(order) -> Order.pay(order) end)
  end
end
