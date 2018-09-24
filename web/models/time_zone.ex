defmodule SRM.TimeZone do
  use SRM.Web, :model
  

  @derive {Poison.Encoder, only: [:id, :time_zone_name, :time_zone_abbrev, :utc_offset, :is_dst]}

  schema "time_zone" do
    field :time_zone_name, :string
    field :time_zone_abbrev, :string
    field :utc_offset, :integer
    field :is_dst, :boolean

    has_many :user, SRM.User

    timestamps()
  end

  @required_fields ~w(time_zone_name time_zone_abbrev utc_offset is_dst)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
