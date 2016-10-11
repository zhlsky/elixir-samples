defmodule Sequence.SubSupervisor do
  use Supervisor

  def start_link(stash_pid),
    do: {:ok, _pid} = Supervisor.start_link __MODULE__, stash_pid
    
  def init(stash_pid) do
    children = [worker(Sequence.Server, [stash_pid])]
    supervise children, strategy: :one_for_one
  end
end

