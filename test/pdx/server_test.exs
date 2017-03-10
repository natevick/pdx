defmodule Pdx.ServerTest do
  use ExUnit.Case
  use PropCheck

  test "spawns server" do
    {:ok, pid} = Pdx.Server.start_link
    assert {_, "something"} = send(pid, {self(), "something"}) 
  end

  property "handles all messages" do
    {:ok, pid} = Pdx.Server.start_link
    forall x in integer() do
      send(pid, x)
      :timer.sleep(10)
      {:message_queue_len, 0} == Process.info(pid, :message_queue_len) 
      
    end
  end
end
