defmodule GW.Repo.Migrations.PermissionsRole do
  use Ecto.Migration

    def change do
      create table(:permissions_role) do
        add :permission_id, references(:permissions, on_delete: :delete_all), null: false
        add :role_id, references(:roles, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end
  end

      # create index(:permissions_role, [:permission_id])
      # create index(:permissions_role, [:role_id])

end

