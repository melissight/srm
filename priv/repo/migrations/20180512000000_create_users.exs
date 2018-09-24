defmodule SRM.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :email, :string, null: false
      add :encrypted_password, :string, size: 255, null: false
      add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false, default: 1
      add :primary_location_id, references(:locations, on_delete: :delete_all)
      add :last_login, :naive_datetime, default: fragment("now()")
      add :reset_password_token, :uuid
      add :reset_password_request_at, :datetime
      add :deactivated_at, :datetime
      timestamps(type: :timestamptz)
    end

    create unique_index(:users, [:email])
    create index(:users, [:time_zone_id])
    create index(:users, [:primary_location_id])
    
  end

end