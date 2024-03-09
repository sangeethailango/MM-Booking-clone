defmodule Mmbooking_Clone.Repo.Migrations.CreateTemplates do
  use Ecto.Migration

  def change do
    create table(:templates) do
      add :name, :string
      add :session_id, references(:sessions, on_delete: :nothing)

      timestamps()
    end

    create index(:templates, [:session_id])
  end
end
