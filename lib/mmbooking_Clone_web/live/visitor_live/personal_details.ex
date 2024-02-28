defmodule Mmbooking_CloneWeb.VisitorLive.PersonalDetails do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  def mount(params, _session, socket) do
    visitor = User.get_visitor_by_id(params["id"])
    family_members = User.family_members(visitor.email_id)

    fam_mem_name = Enum.map(family_members, fn fam_mem -> {fam_mem.first_name, fam_mem.id} end)

    {:ok,
    socket
    |> assign(email_id: visitor.email_id)
    |> assign(first_name: visitor.first_name )
    |> assign(last_name: visitor.last_name )
    |> assign(dob: visitor.dob )
    |> assign(country: visitor.country )
    |> assign(city: visitor.city )
    |> assign(id: visitor.id)
    |> assign(family_member_names: fam_mem_name)
    }
  end

  def handle_event("visitor-name-change", params, socket) do
    visitor = User.get_visitor_by_id(params["id"])

    {:noreply,
    socket
    |> assign(first_name: visitor.first_name )
    |> assign(last_name: visitor.last_name )
    |> assign(dob: visitor.dob )
    |> assign(email_id: visitor.email_id )
    |> assign(country: visitor.country )
    |> assign(city: visitor.city )
    |> assign(email_id: visitor.email_id)
    |> assign(id: visitor.id)
   }
  end
end
