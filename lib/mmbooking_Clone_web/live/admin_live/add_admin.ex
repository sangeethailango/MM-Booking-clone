defmodule Mmbooking_CloneWeb.AdminLive.AddAdmin do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.Authentication

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("save", params, socket) do
    register = Authentication.add_admin(params)

    case register do

     {:error, _} ->

     {:noreply,
     socket
     |> put_flash(:error, "Couldn't insert")
     }

     {:ok, _} ->

      {:noreply,
      socket
      |> put_flash(:info, "Admin inserted successfully")
      }
    end
  end
end
