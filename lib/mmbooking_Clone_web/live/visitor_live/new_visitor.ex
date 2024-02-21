defmodule Mmbooking_CloneWeb.VisitorLive.NewVisitor do
  use Mmbooking_CloneWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("redirect", params, socket) do

    {:noreply,
    socket
    |> push_navigate(to: ~p"/new_booking?first_name=#{params["first_name"]}&last_name=#{params["last_name"]}&dob=#{params["dob"]}&country=#{params["country"]}&last_date_of_visit=#{params["last_date_of_visit"]}&have_you_visited_inner_chamber=#{params["have_you_visited_inner_chamber"]}")
    }
  end
end
