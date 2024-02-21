defmodule Mmbooking_CloneWeb.VisitorLive.Welcome do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("redirect", params, socket) do

    visitors = User.list_all_visitor()
    emails =  Enum.map(visitors, fn visitor -> visitor.email_id end)

    if params["email_id"] in emails do
      {:noreply,
      socket
      |> push_navigate(to: ~p"/new_booking")
      }
    else
      {:noreply,
      socket
      |> push_navigate(to: ~p"/new_visitor")
      }
    end
  end
end
