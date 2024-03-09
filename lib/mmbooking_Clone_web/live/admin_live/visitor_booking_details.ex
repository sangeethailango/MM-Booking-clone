defmodule Mmbooking_CloneWeb.AdminLive.VisitorBookingDetails do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User

  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])
    {:ok,
    socket
    |> assign(visitor: visitor)
    }
  end
end
