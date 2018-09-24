defmodule SRM.Repo.Migrations.CreateTrailerStatusHistory do
    use Ecto.Migration

    def change do
      create table(:trailer_status_history) do
        add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
        add :trailer_status_id, references(:trailer_status, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
      timestamps(type: :timestamptz)
    end

    create index(:trailer_status_history, [:trailer_id])
    create index(:trailer_status_history, [:trailer_status_id])
    create index(:trailer_status_history, [:user_id])

  end

end
