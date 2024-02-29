defmodule Mmbooking_CloneWeb.VisitorLive.YourBookings do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User

  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])
    status = User.status(visitor)

    {:ok,
    socket
    |> assign(visitor: [visitor])
    |> assign(first_name: visitor.first_name)
    |> assign(last_name: visitor.last_name)
    |> assign(status: status)
    |> assign(id: visitor.id)
    }
  end
end
