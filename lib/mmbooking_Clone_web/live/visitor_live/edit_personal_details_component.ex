defmodule Mmbooking_CloneWeb.VisitorLive.EditPersonalDetailsComponent do
  use Mmbooking_CloneWeb, :live_component

  alias Mmbooking_Clone.User
  def render(assigns) do
    ~H"""
    <div>
      <p class="font-bold">Change Personal Details</p>
      <.simple_form :let={form} for={%{}} phx-target={@myself} phx-submit="submit">
        <div class="grid grid-cols-2 ">
          <p class="font-medium text-sm">Email ID</p>
          <p><%= @email_id %></p>
        </div>
        <div class="grid grid-cols-2 ">
          <p class="font-medium text-sm">First Name</p>
          <p > <%= @first_name %> <%=   @last_name %> </p>
        </div>
        <div class="grid grid-cols-2 ">
          <p class="font-medium text-sm">Date OF Birth</p>
          <p><%= Timex.format!(@dob, "{D}-{M}-{YYYY}") %></p>
        </div>
        <.modified_input
          field={form[:last_name]}
          type="text"
          value={@last_name}
          label="Last Name"
          maxlength="20"
          required
          />
          <.modified_input
          field={form[:country]}
          type="select"
          label="Country"
          options={@countries}
          value={@country}
          required
          />
          <.modified_input
          field={form[:city]}
          type="text"
          label="City"
          value={@city}
          maxlength="30"
          required
          />
          <div class=" flex justify-end gap-2   ">
            <.link href={~p"/personal_details/#{@id}"}>
              <p class="inline-block rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3
              text-sm font-semibold leading-6 text-white active:text-white/80 uppercase">Cancel</p>
            </.link>
            <.button phx-disable-with="Saving..." value="submit">Save</.button>
          </div>

       </.simple_form>
    </div>
    """
  end

  def update(assigns, socket) do
    visitor = User.get_visitor_by_id(assigns.visitor_id)
    countries = User.list_of_countries()

    {:ok,
    socket
    |> assign(last_name: visitor.last_name)
    |> assign(country: visitor.country)
    |> assign(email_id: visitor.email_id)
    |> assign(first_name: visitor.first_name)
    |> assign(dob: visitor.dob)
    |> assign(city: visitor.city)
    |> assign(countries: countries)
    |> assign(visitor: visitor)
    |> assign(id: visitor.id)

    }
  end

  def handle_event("submit", visitor_params, socket) do
    User.update_visitor(socket.assigns.visitor, visitor_params)

    {:noreply,
    socket
    |> put_flash(:info, "Successfully Updated!!")
    |> push_navigate(to: ~p"/personal_details/#{socket.assigns.id}")
    }
  end
end
