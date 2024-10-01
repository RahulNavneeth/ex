defmodule M do
  def func do
    receive do
      {:msg, content} ->
        {:ok, state} = {:ok, "#{content} - data"}
        IO.puts(state)
        func()
    end
  end
end

pid = spawn(M, :func, [])
send(pid, {:msg, "Hello world!!!"})
send(pid, {:msg, "damn"})
