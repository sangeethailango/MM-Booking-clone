defmodule Mmbooking_Clone.User do

  alias Mmbooking_Clone.User.Visitor
  alias Mmbooking_Clone.Repo

  def list_all_visitor() do
    Repo.all(Visitor)
  end

  # def insert_new_visitor(user_details) do
  #   Visitor
  #  |> Repo.insert(user_details)
  # end
end
