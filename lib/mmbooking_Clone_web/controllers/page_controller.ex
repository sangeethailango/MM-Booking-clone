defmodule Mmbooking_CloneWeb.PageController do
  use Mmbooking_CloneWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def new_email(conn, params) do
    conn
    |> put_session(:new_email, params["email_id"])
    |> redirect(to: ~p"/visitor_form")
  end
end
