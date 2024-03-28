defmodule Mmbooking_Clone.Repo.Migrations.CreateChangelogs do
  use Ecto.Migration

  def change do
    create table(:changelogs) do
      add :email_id, :string
      add :change_from, :string
      add :change_to, :string

      timestamps()
    end
  end
end
