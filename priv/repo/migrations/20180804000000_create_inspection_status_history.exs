defmodule SRM.Repo.Migrations.CreateInspectionStatusHistory do
    use Ecto.Migration

    def change do
      create table(:inspection_status_history) do
        add :inspection_id, references(:inspections, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :inspection_status_type_id, references(:inspection_status_type, on_delete: :delete_all), null: false
        add :occured_at, :utc_datetime
        add :location_id, references(:locations, on_delete: :delete_all)
        add :performed_by_user, :string, size: 100
      timestamps(type: :timestamptz)
    end

    create index(:inspection_status_history, [:inspection_id])
    create index(:inspection_status_history, [:user_id])
    create index(:inspection_status_history, [:inspection_status_type_id])
    create index(:inspection_status_history, [:location_id])

  end

end
