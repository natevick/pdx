defmodule Pdx.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def init(_) do
    {:ok, :red}
  end

  def handle_info({sender, msg}, state) do
    send sender, :got_it
    {:noreply, state}
  end
  def handle_info(_, state) do
    {:noreply, state}
  end

end