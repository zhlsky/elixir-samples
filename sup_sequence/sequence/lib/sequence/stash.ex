defmodule Sequence.Stash do
  use GenServer

  #####
  # 外部API
  def start_link(current_number),
    do: {:ok, _pid} = GenServer.start_link __MODULE__, current_number

  def save_value(pid, value),
    do: GenServer.cast pid, {:save_value, value}

  def get_value(pid),
    do: GenServer.call pid, :get_value


  #####
  # GenServerの実装
  def handle_call(:get_value, _from, current_value),
    do: {:reply, current_value, current_value}

  def handle_cast({:save_value, value}, _current_value),
    do: {:noply, value}
end 
