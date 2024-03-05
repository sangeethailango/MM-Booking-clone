defmodule Mmbooking_CloneWeb.VisitorLive.NewVisitor do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  alias Mmbooking_CloneWeb.VisitorLive.AcknowledgementEmail

  def mount(_params, session, socket) do
    countries = User.list_of_countries()

    {:ok,
    socket
    |> assign(form: "one")
    |> assign(city: nil)
    |> assign(repeat_visitor: nil)
    |> assign(first_name: nil)
    |> assign(last_name: nil)
    |> assign(city: nil)
    |> assign(country: nil)
    |> assign(dob: nil)
    |> assign(preferred_date: nil)
    |> assign(alternate_date_of_visit: nil)
    |> assign(place_of_stay: nil)
    |> assign(arrival_date: nil)
    |> assign(departure_date: nil)
    |> assign(notes: nil)
    |> assign(date_validation: nil)
    |> assign(kid: false)
    |> assign(have_you_visited_inner_chamber: nil)
    |> assign(email_id: session["new_email"])
    |> assign(list_of_countries: countries)
   }
  end

  def handle_event("visitor-form-submit", params, socket) do
      have_you_visited_inner_chamber = case params["have_you_visited_inner_chamber"] do
        "Yes" -> true
        "No" -> false
      end

      age =  User.calculate_age(params["dob"])

      form = if age > 10 do
        "two"
      else
        "one"
      end

      {:noreply,
      socket
      |> assign(form: form)
      |> assign(kid: true)
      |> assign(city: params["city"])
      |> assign(country: params["country"])
      |> assign(dob: params["dob"])
      |> assign(have_you_visited_inner_chamber: have_you_visited_inner_chamber)
      |> assign(last_date_of_visit: params["last_date_of_visit"])
      |> assign(last_name: params["last_name"])
      |> assign(first_name: params["first_name"])
    }
  end

  def handle_event("visitor-form-change", params, socket) do
    {:noreply,
    socket
    |> assign(repeat_visitor: params["have_you_visited_inner_chamber"])
    |> assign(first_name: params["first_name"])
    |> assign(have_you_visited_inner_chamber: params["have_you_visited_inner_chamber"])
    |> assign(last_name: params["last_name"])
    |> assign(city: params["city"])
    |> assign(country: params["country"])
    |> assign(dob: params["dob"])
    }
  end

  def handle_event("booking-form-submit", params, socket) do

    if params["button"] == "next" do
      date_validation =
        cond do
          params["preferred_date"] == params["arrival_date"] -> "pref date and arr date is same"
          params["preferred_date"] > params["departure_date"] -> "pref date is greater than dep date"
          params["arrival_date"] == params["departure_date"] -> "arr date and dep date are same"
          params["preferred_date"] < params["arrival_date"] -> "pref date is less than arr date"
          params["alternate_date_of_visit"] > params["departure_date"] -> "alt date of visit is greater than dep date"
          true -> nil
        end

        form = if date_validation == nil  do
          "three"
        else
          "two"
        end

        have_you_visited_innter_chamber =
        if socket.assigns.have_you_visited_inner_chamber == "true" do
          "Yes"
        else
          "No"
        end

        {:noreply,
        socket
        |> assign(form: form)
        |> assign(date_validation: date_validation)
        |> assign(first_name: socket.assigns.first_name)
        |> assign(last_name: socket.assigns.last_name)
        |> assign(dob: socket.assigns.dob)
        |> assign(country: socket.assigns.country)
        |> assign(city: socket.assigns.city)
        |> assign(have_you_visited_inner_chamber: have_you_visited_innter_chamber)
        |> assign(last_date_of_visit: socket.assigns.last_date_of_visit)
        |> assign(preferred_date: params["preferred_date"])
        |> assign(alternate_date_of_visit: params["alternate_date_of_visit"])
        |> assign(place_of_stay: params["place_of_stay"])
        |> assign(arrival_date:  params["arrival_date"])
        |> assign(departure_date: params["departure_date"])
        |> assign(notes: params["notes"])
        }
      else
        {:noreply, socket}
      end
  end

  def handle_event("booking-form-change", params, socket) do
    {:noreply,
    socket
    |> assign(preferred_date: params["preferred_date"])
    |> assign(departure_date: params["departure_date"])
    |> assign(dob: socket.assigns.dob)
    |> assign(arrival_date: params["arrival_date"])
    |> assign(alternate_date_of_visit: params["alternate_date_of_visit"])
    |> assign(place_of_stay: params["place_of_stay"])
    |> assign(notes: params["notes"])
    }
  end

  def handle_event("back_button-booking_form", _params, socket) do
    have_you_visited_inner_chamber = if socket.assigns.have_you_visited_inner_chamber == true do
      "Yes"
    else
      "No"
    end

    {:noreply,
    socket
    |> assign(form: "one")
    |> assign(kid: nil)
    |> assign(have_you_visited_inner_chamber: have_you_visited_inner_chamber)
    }
  end

  def handle_event("save", params, socket) do
    if params["button"] == "next" do

      have_you_visited_inner_chamber =
      if socket.assigns.have_you_visited_inner_chamber == "Yes" do
        true
      else
        false
      end

      visitor_detail =  Map.new([{:alternate_date_of_visit, socket.assigns.alternate_date_of_visit },{:arrival_date, socket.assigns.arrival_date},
      {:city, socket.assigns. city},{:country, socket.assigns.country},{:departure_date, socket.assigns.departure_date },{:dob, socket.assigns.dob },
      {:email_id, socket.assigns.email_id},{:first_name, socket.assigns.first_name },{:have_you_visited_inner_chamber, have_you_visited_inner_chamber  },
      {:last_name, socket.assigns.last_name },{:notes, socket.assigns.notes },{:place_of_stay, socket.assigns.place_of_stay },{:preferred_date, socket.assigns.preferred_date},{:last_date_of_visit, socket.assigns.last_date_of_visit}])

      visitor = User.insert_new_visitor(visitor_detail)

      AcknowledgementEmail.welcome(visitor_detail.email_id)

      {:noreply,
      socket
      |> push_navigate(to: ~p"/report/#{visitor.id}")
      }
    else
      {:noreply,
      socket
      |> assign(form: "two")
      }
    end
  end
end
