defmodule KV.Bucket do
  @doc"""
  Start a new bucker.
  """
  def start_link,
    do: Agent.start_link(fn -> %{} end)

  @doc"""
  Gets a value from the 'bucket' by 'key'.
  """
  def get(bucket, key),
    do: Agent.get bucket, &Map.get(&1, key)

  @doc"""
  Puts the 'value' for the given 'key' in the 'bucket'.
  """
  def put(bucket, key, value),
    do: Agent.update bucket, &Map.put(&1, key, value)

end

