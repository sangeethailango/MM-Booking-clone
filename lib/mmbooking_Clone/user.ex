defmodule Mmbooking_Clone.User do

  alias Mmbooking_Clone.User.Visitor
  alias Mmbooking_Clone.Repo

  def list_all_visitor() do
    Repo.all(Visitor)
  end

  # def insert_new_visitor(user_details) do
  #   Repo.insert!(%Visitor{}, user_details)
  # end

  def insert_new_visitor(user_details) do
    %Visitor{}
    |> Visitor.changeset(user_details)
    |> Repo.insert()
  end
end
