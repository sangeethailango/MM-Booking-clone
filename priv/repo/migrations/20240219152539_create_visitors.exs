defmodule Mmbooking_Clone.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email_id, :string
      add :first_name, :string
      add :last_name, :string
      add :dob, :date
      add :country, :string
      add :city, :string
      add :have_you_visited_inner_chamber, :boolean, default: false, null: false
      add :last_date_of_visit, :string
      add :preferred_date, :date
      add :alternate_date_of_visit, :date
      add :place_of_stay, :string
      add :arrival_date, :date
      add :departure_date, :date
      add :notes, :string

      timestamps()
    end

    create index(:visitors, [:id])

  end
end
