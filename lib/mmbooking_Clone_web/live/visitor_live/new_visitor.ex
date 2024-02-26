defmodule Mmbooking_CloneWeb.VisitorLive.NewVisitor do
  use Mmbooking_CloneWeb, :live_view

  alias Mmbooking_Clone.User
  alias Mmbooking_CloneWeb.VisitorLive.AcknowledgementEmail
  def mount(_params, _session, socket) do
    countries = ["Afghanistan",
    "Albania",
    "Algeria",
    "American Samoa",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua And Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia And Herzegovina",
    "Botswana",
    "Bouvet Island",
    "Brazil",
    "British Indian Ocean Territory",
    "Brunei Darussalam",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cayman Islands",
    "Central African Republic",
    "Chad",
    "Chile",
    "China",
    "Christmas Island",
    "Cocos keeling Islands",
    "Colombia",
    "Comoros",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote Divoire",
    "Croatia",
    "Cuba",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "East Timor",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands (malvinas)",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Guiana",
    "French Polynesia",
    "French SouthernTerritories",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guinea",
    "Guinea bissau",
    "Guyana",
    "Haiti",
    "Heard Island And Mcdonald Islands",
    "Holy See (vatican CityState)",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakstan",
    "Kenya",
    "Kiribati",
    "Korea",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Lao People's Democratic Republic",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libyan ArabJamahiriya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Martinique",
    "Mauritania",
    "Mauritius",
    "Mayotte",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montserrat",
    "Montenegro",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Niue",
    "Norfolk Island",
    "Northern MarianaIslands",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "PalestinianTerritory Occupied",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Pitcairn",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russian Federation",
    "Rwanda",
    "Saint Helena",
    "Saint KittsAnd Nevis",
    "Saint Lucia",
    "Saint PierreAnd Miquelon",
    "Saint Vincent And The Grenadines",
    "Samoa SM San Marino",
    "Sao Tome And Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Georgia And The South Sandwich Islands",
    "Spain",
    "Sri Lanka",
    "Sudan",
    "Suriname",
    "Svalbard And Jan Mayen",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syrian ArabRepublic",
    "Taiwan Province Of China",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Togo",
    "Tokelau",
    "Tonga",
    "Trinidad And Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks AndCaicos Islands",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirate",
    "United Kingdom",
    "United States",
    "United States MinorOutlying Islands",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Venezuela",
    "Viet Nam",
    "Virgin Islands Britis",
    "Virgin Islands U.s.",
    "Wallis And Futuna",
    "Western Sahara",
    "Yemen",
    "Zambia",
    "Zimbabwe"]

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
    |> assign(first_name: params["sangeetha"])
    |> assign(have_you_visited_inner_chamber: have_you_visited_inner_chamber)
    |> assign(last_date_of_visit: params["last_date_of_visit"])
    |> assign(last_name: params["last_name"])
    |> assign(first_name: params["first_name"])
  }
  end

  def handle_event("repeat_visitor", params, socket) do
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
    {:noreply,
    socket
    |> assign(form: "three")
    |> assign(first_name: socket.assigns.first_name)
    |> assign(last_name: socket.assigns.last_name)
    |> assign(dob: socket.assigns.dob)
    |> assign(country: socket.assigns.country)
    |> assign(city: socket.assigns.city)
    |> assign(have_you_visited_inner_chamber: socket.assigns.have_you_visited_inner_chamber)
    |> assign(last_date_of_visit: socket.assigns.last_date_of_visit)
    |> assign(preferred_date: params["preferred_date"])
    |> assign(alternate_date: params["alternate_date_of_visit"])
    |> assign(place_of_stay: params["place_of_stay"])
    |> assign(arrival_date: params["arrival_date"] )
    |> assign(departure_date: params["departure_date"])
    |> assign(notes: params["notes"])
    }
  end

  def handle_event("save", _params, socket) do

    visitor =  Map.new([{:alternate_date_of_visit, socket.assigns.alternate_date },{:arrival_date, socket.assigns.arrival_date},
    {:city, socket.assigns. city},{:country, socket.assigns.country},{:departure_date, socket.assigns.departure_date },{:dob, socket.assigns.dob },
    {:email_id, "sangeethailango@gmail.com"},{:first_name, socket.assigns.first_name },{:have_you_visited_inner_chamber, socket.assigns.have_you_visited_inner_chamber },
    {:last_name, socket.assigns.last_name },{:notes, socket.assigns.notes },{:place_of_stay, socket.assigns.place_of_stay },{:preferred_date, socket.assigns.preferred_date},{:last_date_of_visit, socket.assigns.last_date_of_visit}])

    IO.inspect(User.insert_new_visitor(visitor), label: "Visitor data")

    AcknowledgementEmail.welcome(visitor.email_id)

    {:noreply,
    socket
    |> push_navigate(to: ~p"/report")
    }
  end
end
