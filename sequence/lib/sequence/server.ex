defmodule Sequence.Server do
  use GenServer


  #####
  # 外部API

  def start_link(current_number),
    do: GenServer.start_link __MODULE__, current_number, name: __MODULE__

  def next_number,
    do: GenServer.call __MODULE__, :next_number

  def increment_number(delta),
    do: GenServer.cast __MODULE__, {:increment_number, delta}


  #####
  # GenServerの実装
  def handle_call(:next_number, _from, current_number), 
    do: {:reply, current_number, current_number+1}

  def handle_cast({:increment_number, delta}, current_number),
    do: {:noreply, current_number + delta} 
  
  def format_status(_reason, [_pdict, state]),
    do: [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]

end
