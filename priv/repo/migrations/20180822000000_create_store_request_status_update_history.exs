defmodule SRM.Repo.Migrations.CreateRequestStoreStatusUpdateHistory do
    use Ecto.Migration

    def change do
        create table(:request_store_status_update_history) do
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :location_id, references(:locations, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:request_store_status_update_history, [:user_id])
    create index(:request_store_status_update_history, [:location_id])

  end

end
