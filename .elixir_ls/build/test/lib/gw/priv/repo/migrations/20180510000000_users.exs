defmodule GW.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :username, :string, size: 25, null: false
      add :email, :string, null: false
      add :encrypted_password, :string, size: 255, null: false
      add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false
      add :phone, :string, size: 25
      timestamps(type: :timestamptz)
    end

    create unique_index(:users, [:username])
    create index(:users, [:time_zone_id])
    
  end

end