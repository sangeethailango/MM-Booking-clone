defmodule Mmbooking_Clone.Repo.Migrations.AddFieldToUsers do
  use Ecto.Migration

  def change do
    alter table("visitors") do
      add :country_code, :string
    end
  end
end
