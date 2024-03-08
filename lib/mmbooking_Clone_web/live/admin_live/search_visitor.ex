defmodule Mmbooking_CloneWeb.AdminLive.SearchVisitor do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  def mount(_params, session, socket) do
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

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Search Visitors")
  end

  def apply_action(socket, :add_visitor, _params) do
    socket
    |> assign(:page_title, "Add Visitor")
  end

end
