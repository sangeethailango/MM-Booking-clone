defmodule Mmbooking_CloneWeb.AdminLive.SearchVisitor do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  def mount(_params, _session, socket) do
    visitors = User.list_all_visitor()
    {:ok,
    socket
    |> assign(visitors: visitors)
    }
  end

  def handle_event("search", params, socket) do
    visitors = User.search_visitor(params)

    {:noreply,
    socket
    |> assign(visitors: visitors)
   }
  end
end
