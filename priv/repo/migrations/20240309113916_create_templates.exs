defmodule Mmbooking_Clone.Repo.Migrations.CreateTemplates do
  use Ecto.Migration

  def change do
    create table(:templates, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :session_id, references(:sessions, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:templates, [:session_id])
  end
end
