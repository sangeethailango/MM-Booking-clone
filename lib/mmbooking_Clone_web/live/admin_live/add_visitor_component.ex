defmodule Mmbooking_CloneWeb.AdminLive.AddVisitorComponent do
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
      />
      <.input
       field={form[:first_name]}
      label="First Name"
      />
      <.input
      field={form[:last_name]}
      label="Last Name"
      />
      <.input
      field={form[:dob]}
      label="Date Of Birth"
      type="date"
      />
      <.input
      field={form[:country]}
      label="Country"
      type="select"
      options={@countries}
      />
      <.input
      field={form[:city]}
      label="City"
      />

      <.button>Save</.button>
     </.simple_form>
    </div>
    """
  end

  def update(assigns, socket) do
    countries = User.list_of_countries()
    {:ok,
    socket
    |> assign(countries: countries)
    |> assign(assigns)
   }
  end

  def handle_event("save", params, socket) do
    User.insert_new_visitor(params)

    {:noreply,
    socket
    |> push_navigate(to: ~p"/admin/search_visitors")
    |> put_flash(:info, "Suceessfully added")
    }
  end
end
