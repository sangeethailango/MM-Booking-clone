defmodule Mmbooking_Clone.Admin.Template do
  use Ecto.Schema
  import Ecto.Changeset

  schema "templates" do
    field :name, :string
    field :session_id, :id

    timestamps()
  end

  @doc false
  def changeset(template, attrs) do
    template
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
