defmodule Mmbooking_Clone.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :has_visited, :string
      add :date, :date
      add :session, :string
      add :seats_available, :string

      timestamps()
    end

    create index(:bookings, [:id])

  end
end
