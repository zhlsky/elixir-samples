defmodule Fib do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: Fib.of(n-1) + Fib.of(n-2)
end

IO.puts "Start the task"
worker = Task.start_link(fn -> Fib.of(200) end)
IO.puts "Do something else"
IO.puts "Wait for ths task"
#result = Task.await(worker)
#IO.puts "The result is #{result}"
