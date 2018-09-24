defmodule SRM.Repo.Migrations.CreateLogonAttempts do
    use Ecto.Migration

    def change do
      create table(:logon_attempts) do
        add :occurred_at, :utc_datetime, null: false
        add :email, :string, size: 150
        add :ip_address, :string, size: 46, null: false
        add :was_successful, :boolean, null: false
      timestamps(type: :timestamptz)
      end
    
    end

  end
