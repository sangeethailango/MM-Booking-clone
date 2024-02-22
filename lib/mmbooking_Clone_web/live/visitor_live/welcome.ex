defmodule Mmbooking_CloneWeb.VisitorLive.Welcome do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User

  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(agree: nil)
    }
  end

  def handle_event("redirect", params, socket) do
    visitors = User.list_all_visitor()
    emails = Enum.map(visitors, fn visitor -> visitor.email_id end)

    case params["agree"] == "true" do
      true ->
        case params["email_id"] in emails do
          true ->
          {:noreply,
          socket
          |> assign(agree: true)
          |> push_navigate(to: "/new_booking")
          }
          false ->
            {:noreply,
            socket
            |> assign(agree: true)
            |> push_navigate(to: ~p"/new_visitor")
            }
        end
      false ->
        {:noreply,
        socket
        |> assign(agree: false)
        }
    end
  end
end
