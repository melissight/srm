defmodule GW.Repo.Migrations.UserLocation do
  use Ecto.Migration

  def change do
      create table(:user_location) do
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :location_id, references(:address, on_delete: :delete_all), null: false
        add :is_primary_location, :boolean, null: false
        add :is_primary_contact, :boolean, null: false
      timestamps(type: :timestamptz)
    end

    create index(:user_location, [:user_id])
    create index(:user_location, [:location_id])

  end

end
