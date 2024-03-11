defmodule Mmbooking_Clone.Repo.Migrations.ModifyBookings do
  use Ecto.Migration

  def change do
    alter table(:bookings) do
      add :session_id, references(:sessions, type: :binary_id, on_delete: :nothing)
      add :visitor_id, references(:visitors, type: :binary_id, on_delete: :nothing)
      remove :has_visited
      add :has_visited,  :boolean
      remove :seats_available
      remove :session
      add :group_name, :string
      add :status, :string

    end

    create index(:bookings, [:session_id])
    create index(:bookings, [:visitor_id])

  end
end
