defmodule Mmbooking_CloneWeb.Router do
  use Mmbooking_CloneWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Mmbooking_CloneWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mmbooking_CloneWeb do
    pipe_through :browser

    get "/", PageController, :home
    live "/welcome", VisitorLive.Welcome, :index
    live "/visitor_form/:email_id", VisitorLive.NewVisitor
    live "/report/:id", VisitorLive.Report
    live "/visitor_home/:id", VisitorLive.VisitorHome
    live "/personal_details/:id", VisitorLive.PersonalDetails
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mmbooking_CloneWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:mmbooking_Clone, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: Mmbooking_CloneWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
