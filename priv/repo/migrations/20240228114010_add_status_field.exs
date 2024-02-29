defmodule Mmbooking_Clone.Repo.Migrations.AddStatusField do
  use Ecto.Migration

  def change do
    alter table("visitors") do
      add :status, :string
    end
  end
end
