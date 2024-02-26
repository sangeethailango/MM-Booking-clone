defmodule Mmbooking_CloneWeb.VisitorLive.AcknowledgementEmail do
  import Swoosh.Email

  def welcome(email) do
    email =
    new()
    |> from("tony@stark.com")
    |> to(email)
    |> subject("Hello, Avengers!")
    |> html_body("<h1>Hello #{email}</h1>")
    |> text_body("""
      You are now booked

    """
    )

    Mmbooking_Clone.Mailer.deliver(email)

  end
end
