defmodule SRM.Repo.Migrations.CreateUsersRole do
    use Ecto.Migration

    def change do
        create table(:users_role) do
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :role_id, references(:roles, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        create index(:users_role, [:user_id])
        create index(:users_role, [:role_id])
  end

end
