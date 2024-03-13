defmodule Mmbooking_CloneWeb.AdminLive.SessionTemplate do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.Admin
  def mount(_params, _session, socket) do
    templates = Admin.fetch_all_templates()
    template_name = Enum.map(templates, fn name -> name.name end)
    {:ok,
    socket
    |> assign(:sessions, nil)
    |> assign(:template_name, template_name)
    }
  end

  def handle_event("add_template", params, socket) do
    sessions =  Admin.add_session_for_template(params["add_name"])

    templates = Admin.fetch_all_templates()

    template_name = Enum.map(templates, fn name -> name.name end)

    {:noreply,
    socket
    |> assign(:template_name, template_name)
    |> assign(:sessions, [sessions])
   }
  end

  def handle_event("selected_template", params, socket) do

    session = Admin.get_sessions_for_template(params["name"])

    {:noreply,
     socket
     |> assign(:sessions, session)
     }
  end
end
