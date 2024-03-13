defmodule Mmbooking_Clone.Admin.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "bookings" do
    field :date, :date
    field :group_name, :string
    field :status, :string
    field :has_visited, :boolean

    belongs_to :session, Mmbooking_Clone.Admin.Session
    belongs_to :visitor, Mmbooking_Clone.User.Visitor

    timestamps()
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:date, :session, :group_name, :status, :has_visited,  :session_id, :visitor_id])
    |> validate_required([:has_visited, :date, :session])
  end
end
