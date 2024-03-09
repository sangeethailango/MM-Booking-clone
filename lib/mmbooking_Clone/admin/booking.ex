defmodule Mmbooking_Clone.Admin.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :date, :date
    field :has_visited, :string
    field :seats_available, :string
    field :session, :string

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:has_visited, :date, :session, :seats_available])
    |> validate_required([:has_visited, :date, :session, :seats_available])
  end
end
