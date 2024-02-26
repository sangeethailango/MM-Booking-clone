defmodule Mmbooking_Clone.User.Visitor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visitors" do
    field :alternate_date_of_visit, :date
    field :arrival_date, :date
    field :city, :string
    field :country, :string
    field :departure_date, :date
    field :dob, :date
    field :email_id, :string
    field :first_name, :string
    field :have_you_visited_inner_chamber, :boolean, default: false
    field :last_date_of_visit, :string
    field :last_name, :string
    field :notes, :string
    field :place_of_stay, :string
    field :preferred_date, :date

    timestamps()
  end


  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [:email_id, :first_name, :last_name, :dob, :country, :city, :have_you_visited_inner_chamber, :last_date_of_visit, :preferred_date, :alternate_date_of_visit, :place_of_stay, :arrival_date, :departure_date, :notes])
    |> validate_required([:email_id, :first_name, :last_name, :dob, :country, :city, :have_you_visited_inner_chamber,  :preferred_date, :alternate_date_of_visit, :place_of_stay, :arrival_date, :departure_date, :notes])
  end
end
