defmodule Mmbooking_Clone.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :session_number, :integer
      add :visitor_type, :string
      add :chamber_time_from, :time
      add :chamber_to_time, :time
      add :report_time_from, :time
      add :report_time_to, :time
      add :seat, :integer
      add :date, :date
      add :booking_id, references(:bookings, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:sessions, [:booking_id])

  end
end
