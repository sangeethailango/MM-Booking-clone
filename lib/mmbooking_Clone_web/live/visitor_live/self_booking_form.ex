defmodule Mmbooking_CloneWeb.VisitorLive.SelfBookingForm do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])
    {:ok,
    socket
    |> assign(first_name: visitor.first_name)
    |> assign(last_name: visitor.last_name)
    |> assign(date_validation: nil)
    |> assign(visitor: visitor)
    }
  end

  def handle_event("submit", visitor_params, socket) do
    date_validation = cond do
      visitor_params["preferred_date"] == visitor_params["arrival_date"] -> "pref date and arr date is same"
      visitor_params["preferred_date"] > visitor_params["departure_date"] -> "pref date is greater than dep date"
      visitor_params["arrival_date"] == visitor_params["departure_date"] -> "arr date and dep date are same"
      visitor_params["preferred_date"] < visitor_params["arrival_date"] -> "pref date is less than arr date"
      visitor_params["alternate_date_of_visit"] > visitor_params["departure_date"]  -> "alt date of visit is greater than dep date"
      true -> nil
    end

    if date_validation == nil do
      {:noreply,
      socket
      |> assign(date_validation: date_validation)
      |> put_flash(:info, "Successfully Updated")
      |> redirect(to: ~p"/visitor_home/#{socket.assigns.visitor.id}")
      }
    else
      {:noreply,
      socket
      |> assign(date_validation: date_validation)
      }
    end
  end
end
