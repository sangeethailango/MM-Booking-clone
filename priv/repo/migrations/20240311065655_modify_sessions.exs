defmodule Mmbooking_Clone.Repo.Migrations.ModifySessions do
  use Ecto.Migration

  def change do
    alter table(:sessions) do
      remove :booking_id, references(:bookings, type: :binary_id, on_delete: :nothing)
      add :template_id, references(:templates, type: :binary_id, on_delete: :nothing)
      remove :visitor_type
      add :group_name, :string
    end

    create index(:sessions, [:template_id])
  end
end
