# alias SRM.{Repo, User}

# [
#   %{
    
#     first_name: "Melissa",
#     last_name: "Capps",
#     username: "mcapps",
#     email: "melissa@sightsource.net",
#     password: "12345",
#     time_zone_id: 1
    
    
#   },
# ]
# |> Enum.map(&User.changeset(%User{}, &1))
# |> Enum.each(&Repo.insert!(&1))



alias SRM.{Repo, TimeZone}

[
  %{
    
    time_zone_name: "Eastern Standard",
    time_zone_abbrev: "EST",
    utc_offset: -5,
    is_dst: true
  },
]
|> Enum.map(&TimeZone.changeset(%TimeZone{}, &1))
|> Enum.each(&Repo.insert!(&1))