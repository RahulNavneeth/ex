defmodule Counter do
  use Agent

  def start_link(init) do
    Agent.start_link(fn -> init end, name: :count)
  end

  def value do
    Agent.get(:count, fn state -> state end)
  end

  def increment do
    Agent.update(:count, fn state -> state + 1 end)
  end
end

Counter.start_link(0)

IO.puts(Counter.value())

Counter.increment()
Counter.increment()
Counter.increment()

IO.puts(Counter.value())
