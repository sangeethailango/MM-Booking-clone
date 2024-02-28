defmodule Mmbooking_CloneWeb.VisitorLive.Welcome do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User

  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(email_id: nil)
    |> assign(agree: nil)
    }
  end

  def handle_event("proceed", params, socket) do

    all_visitors = User.list_all_visitor()
    emails = Enum.map(all_visitors, fn visitor -> visitor.email_id end)

    family_members = User.family_members(params["email_id"])
    id = List.first(family_members)

    case params["agree"] == "true" do
      true ->
        if params["email_id"] in emails do
          {:noreply,
          socket
          |> push_navigate(to: ~p"/visitor_home/#{id}")
          }
        else
          {:noreply,
          socket
          |> push_navigate(to: ~p"/form/#{params["email_id"]}")
          }
        end
      false ->
        {:noreply,
        socket
        |> assign(email_id: params["email_id"])
        |> assign(agree: false)
        }
    end
  end
end
