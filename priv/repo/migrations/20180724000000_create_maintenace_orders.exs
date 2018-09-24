defmodule SRM.Repo.Migrations.CreateMaintenanceOrders do
    use Ecto.Migration

    def change do
        create table(:maintenance_orders) do
          add :maintenance_type_id, references(:maintenance_type, on_delete: :delete_all), null: false
          add :location_id, references(:locations, on_delete: :delete_all), null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :current_maintenance_status_id, references(:maintenance_status_type, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end
        
        create index(:maintenance_orders, [:maintenance_type_id])
        create index(:maintenance_orders, [:user_id])
        create index(:maintenance_orders, [:trailer_id])
        create index(:maintenance_orders, [:location_id])
        create index(:maintenance_orders, [:current_maintenance_status_id])
        

  end

end
