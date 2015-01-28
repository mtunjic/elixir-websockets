defmodule ElixirWs.WsHandler do
  def init(_, _, _) do
    {:upgrade, :protocol, :cowboy_websocket}
  end
  
  
  def websocket_init(_, req, _) do
    send_messages(self)
    {:ok, req, nil}
  end
  
  defp send_messages(process) do
    :todo
  end
  
  
  def websocket_info({:message, msg}, req, state) do
    {:reply, {:text, msg}, req, state}
  end
  
  def websocket_info(_, req, state) do
    {:ok, req, state}
  end
  
  
  def websocket_handle({:text, msg}, req, state) do
    {:reply, {:text, "#{msg}"}, req, state}
  end
  
  def websocket_handle(_, req, state) do
    {:ok, req, state}
  end
  
  
  def websocket_terminate(_, _, _) do
    :ok
  end
end
