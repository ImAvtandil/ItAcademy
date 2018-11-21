defmodule ChatWeb.RoomChannel do
  use ChatWeb, :channel

  def join("room:chat", payload, socket) do
    if authorized?(payload) do
      send self(), :after_join 
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end
  def handle_info(:after_join, socket) do 
    push socket, "message_list", %{"messages"=>:ets.lookup(:history, "chat") |> Enum.map(fn({_, msg})->msg end)}
    {:noreply, socket}
  end
  def handle_in("new_message", %{"text"=>""}, socket) do
    {:noreply, socket}
  end
  def handle_in("new_message", payload, socket) do
    case payload["text"] do
      ""->:ok
      _->
        :ets.insert(:history, {"chat", payload})
        broadcast socket, "new_message", payload
        :ok
    end    
    {:noreply, socket}
  end
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

 
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
