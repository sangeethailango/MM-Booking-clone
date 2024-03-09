defmodule Mmbooking_Clone.Repo.Migrations.AddRole do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string
    end
  end
end
