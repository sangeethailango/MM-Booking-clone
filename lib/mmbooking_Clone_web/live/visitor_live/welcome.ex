defmodule Mmbooking_CloneWeb.VisitorLive.Welcome do
  use Mmbooking_CloneWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(email_id: nil)
    |> assign(agree: nil)
    }
  end

  def handle_event("proceed", params, socket) do

    case params["agree"] == "true" do
      true ->
        {:noreply,
        socket
        |> push_navigate(to: ~p"/form")
        }
      false ->
        {:noreply,
        socket
        |> assign(email_id: params["email_id"])
        |> assign(agree: false)
        }
    end
  end
end
