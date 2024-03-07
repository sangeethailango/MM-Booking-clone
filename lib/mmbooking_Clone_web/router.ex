defmodule Mmbooking_CloneWeb.Router do
  use Mmbooking_CloneWeb, :router

  import Mmbooking_CloneWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Mmbooking_CloneWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/visitor", Mmbooking_CloneWeb do
    pipe_through :browser

    live "/welcome", VisitorLive.Welcome, :index
    get "/welcome/new_visitor/:email_id", PageController, :new_email
    live "/visitor_form", VisitorLive.NewVisitor
    live "/report/:id", VisitorLive.Report
    live "/visitor_home/:id", VisitorLive.VisitorHome
    live "/personal_details/:id", VisitorLive.PersonalDetails, :index
    live "/edit_personal_details/:id", VisitorLive.PersonalDetails, :edit
    live "/your_bookings/:id", VisitorLive.YourBookings
    live "/self_form_booking/:id", VisitorLive.SelfBookingForm
  end

  ## Admin routes

  scope "/admin", Mmbooking_CloneWeb do
    pipe_through [:browser, :is_user_admin]

    live "/search_visitors", AdminLive.SearchVisitor, :index
    live "/search_visitors/add_visitor", AdminLive.SearchVisitor, :add_visitor
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

  ## Authentication routes

  scope "/", Mmbooking_CloneWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{Mmbooking_CloneWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/", UserLoginLive, :new
      live "/reset_password", UserForgotPasswordLive, :new
      live "/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/", UserSessionController, :create
  end

  scope "/", Mmbooking_CloneWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{Mmbooking_CloneWeb.UserAuth, :ensure_authenticated}] do
      live "/settings", UserSettingsLive, :edit
      live "/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", Mmbooking_CloneWeb do
    pipe_through [:browser]

    delete "/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{Mmbooking_CloneWeb.UserAuth, :mount_current_user}] do
      live "/confirm/:token", UserConfirmationLive, :edit
      live "/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
