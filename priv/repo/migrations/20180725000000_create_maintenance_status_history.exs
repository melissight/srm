defmodule SRM.Repo.Migrations.CreateMaintenanceStatusHistory do
    use Ecto.Migration

    def change do
      create table(:maintenance_status_history) do
        add :maintenance_order_id, references(:maintenance_orders, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
        add :quoted_start_date, :date
        add :quoted_delivery_date, :date
        add :quoted_estimated_cost, :"double precision"
        add :performed_by_user_id, references(:users, on_delete: :delete_all)
        add :actual_delivery_date, :date
        add :current_maintenance_status_id, references(:maintenance_status_type, on_delete: :delete_all), null: false
        add :maintenance_status_image_id, references(:images, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:maintenance_status_history, [:maintenance_order_id])
    create index(:maintenance_status_history, [:user_id])
    create index(:maintenance_status_history, [:preferred_vendor_location_id])
    create index(:maintenance_status_history, [:performed_by_user_id])
    create index(:maintenance_status_history, [:current_maintenance_status_id])

  end

end
