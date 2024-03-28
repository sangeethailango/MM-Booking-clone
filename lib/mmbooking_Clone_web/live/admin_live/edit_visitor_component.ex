defmodule Mmbooking_CloneWeb.AdminLive.EditVisitorComponent do
  use Mmbooking_CloneWeb, :live_component

  alias Mmbooking_Clone.User

  def render(assigns) do
    ~H"""
    <div>
      <.simple_form for={%{}} :let={form} phx-target={@myself} phx-submit="save">

          <.input
          field={form[:email_id]}
          label="Email ID"
          type="email"
          value = {@visitor.email_id}
          />
          <.input
          field={form[:first_name]}
          label="First Name"
          value = {@visitor.first_name}
          />
          <.input
          field={form[:last_name]}
          label="Last Name"
          value = {@visitor.last_name}
          />
          <.input
          field={form[:dob]}
          label="Date Of Birth"
          value = {@visitor.dob}
          type="date"
          />
          <.input
          field={form[:country]}
          label="Country"
          value = {@visitor.country}
          type="select"
          options={@countries}
          />
          <.input
          field={form[:city]}
          label="City"
          value = {@visitor.city}
          />

        <.button>Save</.button>
      </.simple_form>
    </div>
    """
  end

  def update(assigns, socket) do
    visitor = User.get_visitor_by_id(assigns.visitor_id)
    countries = User.list_of_countries()

    {:ok,
    socket
    |> assign(countries: countries)
    |> assign(assigns)
    |> assign(:visitor, visitor)
  }
  end

  def handle_event("save", params, socket) do
    User.insert_new_visitor(params) |> IO.inspect(label: "insert new visitor")

    {:noreply, socket}
  end
end
