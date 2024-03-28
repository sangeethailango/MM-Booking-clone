defmodule Mmbooking_Clone.User.Changelog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "changelogs" do
    field :change_from, :string
    field :change_to, :string
    field :email_id, :string

    timestamps()
  end

  @doc false
  def changeset(changelog, attrs) do
    changelog
    |> cast(attrs, [:email_id, :change_from, :change_to])
    |> validate_required([:email_id, :change_from, :change_to])
  end
end
