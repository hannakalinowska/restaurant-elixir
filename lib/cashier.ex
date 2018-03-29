defmodule Cashier do
  use Agent

  def start_link do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def handle(order) do
    IO.inspect("CASHIER")
    Agent.cast(__MODULE__, fn(orders) -> [order | orders] end)
  end

  def pay_outstanding_orders do
    IO.inspect("CASHIER - PAY")
    Agent.get(__MODULE__, fn(orders) -> Enum.map(orders, fn(order) -> Order.pay(order) end) end)
  end
end
