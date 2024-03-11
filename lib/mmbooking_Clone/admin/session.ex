defmodule Mmbooking_Clone.Admin.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :chamber_time_from, :time
    field :chamber_to_time, :time
    field :date, :date
    field :report_time_from, :time
    field :report_time_to, :time
    field :seat, :integer
    field :session_number, :integer
    field :group_name, :string

    belongs_to :template, Mmbooking_Clone.Admin.Template

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:session_number,  :chamber_time_from, :chamber_to_time, :report_time_from, :report_time_to, :seat, :date, :session_number, :group_name, :template_id])
    |> validate_required([:session_number, :chamber_time_from, :chamber_to_time, :report_time_from, :report_time_to, :seat, :date])
  end
end
