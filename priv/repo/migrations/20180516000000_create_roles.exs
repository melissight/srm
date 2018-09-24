defmodule SRM.Repo.Migrations.CreateRoles do
    use Ecto.Migration
  
    def change do
      create table(:roles) do
        add :role_title, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

    create unique_index(:roles, [:role_title])

  end
  
end