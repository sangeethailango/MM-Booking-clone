defmodule Mmbooking_CloneWeb.VisitorLive.NewVisitor do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  alias Mmbooking_CloneWeb.VisitorLive.AcknowledgementEmail
  def mount(params, _session, socket) do
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
    |> assign(email_id: params["email_id"])
    |> assign(list_of_countries: countries)
   }
  end

  def handle_event("visitor-form-submit", params, socket) do
    have_you_visited_inner_chamber = case params["have_you_visited_inner_chamber"] do
      "Yes" -> true
      "No" -> false
    end

    {:noreply,
    socket
    |> assign(form: "two")
    |> assign(city: params["city"])
    |> assign(country: params["country"])
    |> assign(dob: params["dob"])
    |> assign(have_you_visited_inner_chamber: have_you_visited_inner_chamber)
    |> assign(last_date_of_visit: params["last_date_of_visit"])
    |> assign(last_name: params["last_name"])
    |> assign(first_name: params["first_name"])
  }
  end

  def handle_event("repeat_visitor-change", params, socket) do
    {:noreply,
    socket
    |> assign(repeat_visitor: params["have_you_visited_inner_chamber"])
    |> assign(first_name: params["first_name"])
    |> assign(last_name: params["last_name"])
    |> assign(city: params["city"])
    |> assign(country: params["country"])
    |> assign(dob: params["dob"])
    }
  end

  def handle_event("booking-form-submit", params, socket) do



    date_validation = cond do
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
    |> assign(dob: User.date_format(socket.assigns.dob))
    |> assign(country: socket.assigns.country)
    |> assign(city: socket.assigns.city)
    |> assign(have_you_visited_inner_chamber: have_you_visited_innter_chamber)
    |> assign(last_date_of_visit: socket.assigns.last_date_of_visit)
    |> assign(preferred_date: User.date_format(params["preferred_date"]))
    |> assign(alternate_date_of_visit: User.date_format(params["alternate_date_of_visit"]))
    |> assign(place_of_stay: params["place_of_stay"])
    |> assign(arrival_date:  User.date_format(params["arrival_date"]))
    |> assign(departure_date: User.date_format(params["departure_date"]))
    |> assign(notes: params["notes"])
    }
  end

  def handle_event("booking-form-validation-change", params, socket) do

    {:noreply,
    socket
    |> assign(preferred_date: params["preferred_date"])
    |> assign(departure_date: params["departure_date"])
    |> assign(arrival_date: params["arrival_date"])
    |> assign(alternate_date_of_visit: params["alternate_date_of_visit"])
    |> assign(place_of_stay: params["place_of_stay"])
    |> assign(notes: params["notes"])
    }
  end

  def handle_event("save", _params, socket) do
    have_you_visited_inner_chamber = if socket.assigns.have_you_visited_inner_chamber == "Yes" do
      true
    else
      false
    end

    visitor_detail =  Map.new([{:alternate_date_of_visit, socket.assigns.alternate_date },{:arrival_date, socket.assigns.arrival_date},
    {:city, socket.assigns. city},{:country, socket.assigns.country},{:departure_date, socket.assigns.departure_date },{:dob, socket.assigns.dob },
    {:email_id, socket.assigns.email_id},{:first_name, socket.assigns.first_name },{:have_you_visited_inner_chamber, have_you_visited_inner_chamber  },
    {:last_name, socket.assigns.last_name },{:notes, socket.assigns.notes },{:place_of_stay, socket.assigns.place_of_stay },{:preferred_date, socket.assigns.preferred_date},{:last_date_of_visit, socket.assigns.last_date_of_visit}])

    visitor = User.insert_new_visitor(visitor_detail)

    AcknowledgementEmail.welcome(visitor_detail.email_id)

    {:noreply,
    socket
    |> push_navigate(to: ~p"/report/#{visitor.id}")
    }
  end
end
