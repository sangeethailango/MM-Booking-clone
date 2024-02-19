defmodule Mmbooking_CloneWeb.ErrorJSONTest do
  use Mmbooking_CloneWeb.ConnCase, async: true

  test "renders 404" do
    assert Mmbooking_CloneWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Mmbooking_CloneWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
