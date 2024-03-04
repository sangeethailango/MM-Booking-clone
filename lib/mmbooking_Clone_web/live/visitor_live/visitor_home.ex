defmodule Mmbooking_CloneWeb.VisitorLive.VisitorHome do
  use Mmbooking_CloneWeb, :live_view
  alias Mmbooking_Clone.User

  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])
    family_members = User.family_members(visitor.email_id)

    {:ok,
    socket
    |> assign(family_members: family_members)
    |> assign(email_id: visitor.email_id)
    |> assign(id: visitor.id)
    |> assign(warning: false)
    }
  end

  def handle_event("Add-New-Member", _params, socket) do
    family_members = User.family_members(socket.assigns.email_id)

    if Enum.count(family_members) >= 6 do
      {:noreply,
      socket
      |> assign(warning: true)
      }
    else
      {:noreply,
      socket
      |> push_navigate(to: ~p"/visitor_form/#{socket.assigns.email_id}")
      }
    end
  end

  def handle_event("selected-member-change", params, socket) do

    {:noreply,
    socket
    |> assign(id: params["value"])
    }
  end

  def handle_event("bookings", _params, socket) do
    {:noreply,
    socket
    |> push_navigate(to: ~p"/your_bookings/#{socket.assigns.id}")
    }
  end
end
