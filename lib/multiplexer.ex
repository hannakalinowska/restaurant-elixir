defmodule Multiplexer do
  use Agent

  def start_link(count, handler, next_handler) do
    Agent.start_link(
      fn -> Enum.map(
        (1 .. count),
        fn(_index) ->
          {:ok, pid} = handler.start_link(next_handler)
          {handler, pid}
        end
      )
      end,
      name: __MODULE__
    )
  end

  def handle(order) do
    Agent.cast(
      __MODULE__,
      fn handlers ->
        Enum.map(handlers, fn {handler, pid} ->
          handler.handle(pid, order)
          {handler, pid}
        end)
      end
    )
  end
end
