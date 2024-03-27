defmodule Mmbooking_Clone.Admin do

  alias Mmbooking_Clone.Admin.Session
  alias Mmbooking_Clone.Repo
  alias Mmbooking_Clone.Admin.Template
  import Ecto.Query


  def insert_session_for_template(template_name) do

    template =
      %Template{
      name: template_name
      } |> Repo.insert!()

    %Session{
    chamber_time_from: ~T[05:15:30],
    chamber_to_time: ~T[23:00:07],
    date: ~D[2029-08-29],
    report_time_from:  ~T[10:00:00],
    report_time_to: ~T[20:00:00],
    seat: 20,
    session_number: 1,
    group_name: "First Group",
    template_id: template.id
    }
    |> Repo.insert!() |> Repo.preload(:template)
  end

  def fetch_all_templates() do
    Repo.all(Template)
  end

  def get_template_by_template_id(template_name) do
    query =
    from v in Template,
    where: v.name == ^template_name

    Repo.all(query)

  end

  def get_sessions_for_template(template_name) do
    template = List.first(get_template_by_template_id(template_name))
    query =
      from s in Session,
      where: s.template_id == ^template.id

    Repo.all(query)
  end
end
