defmodule Mmbooking_Clone.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :has_visited, :string
      add :date, :date
      add :session, :string
      add :seats_available, :string

      timestamps()
    end
  end
end
