defmodule Mmbooking_CloneWeb.VisitorLive.Report do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])

    {:ok,
    socket
    |> assign(email_id: visitor.email_id )
    |> assign(id: visitor.id )
  }
  end
end
