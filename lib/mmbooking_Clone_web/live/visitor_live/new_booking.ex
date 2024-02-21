defmodule Mmbooking_CloneWeb.VisitorLive.NewBooking do
  use Mmbooking_CloneWeb, :live_view

  def mount(params, _session, socket) do

    {:ok,
    socket
    |> assign(first_name: params["first_name"])
    |> assign(last_name: params["last_name"])
    |> assign(dob: params["dob"])
    |> assign(country: params["country"])
    |> assign(city: params["city"])
    |> assign(last_date_of_visit: params["last_date_of_visit"])
    |> assign(have_you_visited_inner_chamber: params["have_you_visited_inner_chamber"])
   }
  end

  def handle_event("redirect", _params, socket) do
    {:noreply, socket}
  end
end
