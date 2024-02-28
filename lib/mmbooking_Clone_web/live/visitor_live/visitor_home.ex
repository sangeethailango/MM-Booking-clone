defmodule Mmbooking_CloneWeb.VisitorLive.VisitorHome do
  use Mmbooking_CloneWeb, :live_view
  alias Mmbooking_Clone.User

  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])
    family_members = User.family_members(visitor.email_id)

    {:ok,
    socket
    |> assign(family_members: family_members)
    }
  end
end
