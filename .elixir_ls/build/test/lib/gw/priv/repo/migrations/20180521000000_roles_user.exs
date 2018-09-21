defmodule GW.Repo.Migrations.RolesUser do
    use Ecto.Migration

    def change do
        create table(:roles_user) do
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :role_id, references(:roles, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:roles_user, [:user_id])
        create index(:roles_user, [:role_id])
  end

end
