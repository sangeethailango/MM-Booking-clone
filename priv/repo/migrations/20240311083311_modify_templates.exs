defmodule Mmbooking_Clone.Repo.Migrations.ModifyTemplates do
  use Ecto.Migration

  def change do
    alter table(:templates) do
      remove :session_id, references(:sessions, type: :binary_id, on_delete: :nothing)
    end
  end
end
