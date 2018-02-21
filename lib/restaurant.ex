defmodule Restaurant do
  @moduledoc """
  Documentation for Restaurant.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Restaurant.hello
      :world

  """
  def main(_args) do
    {:ok, agent} = Agent.start_link(fn -> [] end)

    Enum.map(['Pizza', 'Cake'], fn(item) ->
      Waiter.place_order(item)
      |> Cook.handle
      |> AssistantManager.handle
      |> Cashier.handle(agent)
    end)

    Cashier.pay_outstanding_orders(agent)
    |> OrderPrinter.handle

    Agent.stop(agent)
  end
end
