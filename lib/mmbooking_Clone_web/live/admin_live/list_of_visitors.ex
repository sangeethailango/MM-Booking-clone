defmodule Mmbooking_CloneWeb.AdminLive.ListOfVisitors do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User

  def mount(_params, _session, socket) do
    list_of_visitors = User.list_all_visitor()

    {:ok,
    socket
    |> assign(:list_of_visitors, list_of_visitors)
    }
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "List Of Visitors")
  end


  def apply_action(socket, :edit_visitor, params) do
    socket
    |> assign(:page_title, "Edit Visitor")
    |> assign(:visitor_id, params["visitor_id"])
  end
end
