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
    {:ok, _multiplexer} = Multiplexer.start_link(3, Cook, AssistantManager)
    #{:ok, _cook} = Cook.start_link(AssistantManager)
    {:ok, _assistant_manager} = AssistantManager.start_link(Cashier)
    {:ok, _cashier} = Cashier.start_link

    Enum.map(['Pizza', 'Cake'], fn(item) ->
      Waiter.place_order(item)
      |> Multiplexer.handle
    end)

    :timer.sleep(8000)

    Cashier.pay_outstanding_orders
    |> OrderPrinter.handle
  end
end
