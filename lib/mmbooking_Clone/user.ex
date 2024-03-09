defmodule Mmbooking_Clone.User do

  import Ecto.Query
  alias Mmbooking_Clone.User.Visitor
  alias Mmbooking_Clone.Repo
  alias Mmbooking_Clone.Authentication.User

  def list_all_visitor() do
    Repo.all(Visitor)
  end

  def insert_new_visitor(visitor_details) do
    %Visitor{}
    |> Visitor.add_visitor_admin_changeset(visitor_details)
    |> Repo.insert!()
  end

  def update_visitor(%Visitor{} = visitor, visitor_details) do
    visitor
    |> Visitor.changeset(visitor_details)
    |> Repo.update()
  end

  def get_visitor_by_id(id) do
    Repo.get(Visitor, id)
  end

  def family_members(email_id) do
    query =
      from v in Visitor,
      where: v.email_id == ^email_id

    Repo.all(query)
  end

  def search_visitor(search_params) do
    Visitor
    |> visitor_query(search_params)
    |> Repo.all()
  end

  def visitor_query(visitor, search_params)  do
    search_params
    |> Enum.reject(fn {_key, value} -> String.trim(value) == "" end)
    |> Enum.reduce(visitor, fn

      {"first_name", first_name}, visitor -> from p in visitor, where: p.first_name == ^first_name

      {"last_name", last_name}, visitor -> from p in visitor, where: p.last_name == ^last_name

      {"email_id", email_id}, visitor -> from p in visitor, where: p.email_id == ^email_id

      {"city", city}, visitor -> from p in visitor, where: p.city == ^city

      {"dob", dob}, visitor -> from p in visitor, where: p.dob == ^dob

      {"preferred_date", preferred_date}, visitor -> from p in visitor, where: p.preferred_date == ^preferred_date

      _, visitor ->
        visitor

    end
    )
  end

  def date_format(date) do
    date = Date.from_iso8601!(date)
    Timex.format!(date, "{D}-{M}-{YYYY}")
  end

  def status(visitor) do
    if Date.compare(visitor.preferred_date, Date.utc_today) == :gt do
      "Request Sent"
    else
      "Expired"
    end
  end

  def get_user_by_email(email_id) do
    Repo.get_by(User, email: email_id)
  end

  def calculate_age(dob) do
    dob = Date.from_iso8601!(dob)
    number_of_days = Date.diff(Date.utc_today, dob)
    number_of_days / 365
  end

  def is_admin(email_id) do
    user = get_user_by_email(email_id)
    case user.role == "admin" do
      true -> true
      false -> false
    end
  end

  def list_of_countries() do
    ["Afghanistan",
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
  end
end
