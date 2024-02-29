defmodule Mmbooking_CloneWeb.VisitorLive.EditPersonalDetailsComponent do
  use Mmbooking_CloneWeb, :live_component

  alias Mmbooking_Clone.User
  def render(assigns) do
    ~H"""
    <div>
      <div class="grid grid-cols-2">
        <p class="font-bold">Change Personal Details</p>
        <div class="text-right">
            <.link href={~p"/personal_details/#{@id}"}>
              <.button>Cancel</.button>
            </.link>
        </div>
      </div>

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
          <p><%= @dob %></p>
        </div>
        <.input
          field={form[:last_name]}
          type="text"
          value={@last_name}
          label="Last Name"
          maxlength="20"
          required
          />
          <.input
          field={form[:country]}
          type="select"
          label="Country"
          options={@countries}
          value={@country}
          required
          />
          <.input
          field={form[:city]}
          type="text"
          label="City"
          value={@city}
          maxlength="30"
          required
          />
          <div class="text-right ">
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
