defmodule Mmbooking_Clone.Admin do

  alias Mmbooking_Clone.Admin.Session
  alias Mmbooking_Clone.Repo
  alias Mmbooking_Clone.Admin.Template
  import Ecto.Query


  def insert_sessions_for_template(template_name) do
    if template_name == "Dharshan Day" do
      insert_sessions_for_template(template_name,  1..8)
    else
      insert_sessions_for_template(template_name,  1..7)
    end
  end

  def insert_sessions_for_template(template_name, number_of_sessions) do

    template_params = %{
      name: template_name
    }

    template =
    %Template{}
    |> Template.changeset(template_params)
    |> Repo.insert!()

    for session <- number_of_sessions do
        session_params = %{
        chamber_time_from: ~T[05:15:30],
        chamber_to_time: ~T[23:00:07],
        date: ~D[2029-08-29],
        report_time_from:  ~T[10:00:00],
        report_time_to: ~T[20:00:00],
        seat: 20,
        session_number: session,
        group_name: "#{session} Group ",
        template_id: template.id
        }

        %Session{}
        |> Session.changeset(session_params)
        |> Repo.insert!()
    end
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
