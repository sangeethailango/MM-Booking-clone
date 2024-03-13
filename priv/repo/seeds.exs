# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mmbooking_Clone.Repo.insert!(%Mmbooking_Clone.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

#   alias Mmbooking_Clone.Repo
#   alias Mmbooking_Clone.Admin.Session
#   alias Mmbooking_Clone.Admin.Template

#  regular_day =  Repo.insert!(%Template{
#     name: "Regular day"
#   })

#   Repo.insert!(%Template{
#     name: "Birthday Week"
#   })


#   Repo.insert!(%Session{
#     chamber_time_from: ~T[05:15:30],
#     chamber_to_time: ~T[23:00:07],
#     date: ~D[2029-08-29],
#     report_time_from:  ~T[10:00:00],
#     report_time_to: ~T[20:00:00],
#     seat: 20,
#     session_number: 1,
#     group_name: "First Group",
#     template_id: regular_day.id
#   })

#   Repo.insert!(%Session{
#     chamber_time_from: ~T[12:00:00],
#     chamber_to_time: ~T[23:02:07],
#     date: ~D[2024-01-30],
#     report_time_from:  ~T[15:01:00],
#     report_time_to: ~T[16:00:00],
#     seat: 60,
#     session_number: 2,
#     group_name: "Second Group",
#     template_id: regular_day.id
#   })

#   Repo.insert!(%Session{
#     chamber_time_from: ~T[13:00:00],
#     chamber_to_time: ~T[21:00:00],
#     date: ~D[2025-10-01],
#     report_time_from: ~T[16:00:00],
#     report_time_to: ~T[17:00:00],
#     seat: 70,
#     session_number: 3,
#     group_name: "Third Group",
#     template_id: regular_day.id
#   })

#   Repo.insert!(%Session{
#     chamber_time_from: ~T[14:15:30],
#     chamber_to_time: ~T[01:00:07],
#     date: ~D[2024-07-10],
#     report_time_from: ~T[17:00:00],
#     report_time_to: ~T[18:00:00],
#     seat: 100,
#     session_number: 4,
#     group_name: "Fourth Group",
#     template_id: regular_day.id
#   })


#   Repo.insert!(%Session{
#     chamber_time_from: ~T[15:15:30],
#     chamber_to_time: ~T[03:00:07],
#     date: ~D[2030-01-29],
#     report_time_from: ~T[18:01:02],
#     report_time_to: ~T[19:00:00],
#     seat: 35,
#     session_number: 5,
#     group_name: "Fifth Group",
#     template_id: regular_day.id
#   })


#   Repo.insert!(%Session{
#     chamber_time_from: ~T[16:17:30],
#     chamber_to_time: ~T[05:00:07],
#     date: ~D[2019-08-29],
#     report_time_from:  ~T[10:12:00],
#     report_time_to: ~T[20:30:00],
#     seat: 40,
#     session_number: 6,
#     group_name: "Sixth Group",
#     template_id: regular_day.id
#   })
