defmodule Mmbooking_Clone.User do

  alias Mmbooking_Clone.User.Visitor
  alias Mmbooking_Clone.Repo

  def list_all_visitor() do
    Repo.all(Visitor)
  end

end
