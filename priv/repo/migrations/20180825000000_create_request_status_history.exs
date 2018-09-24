defmodule SRM.Repo.Migrations.CreateRequestStatusHistory do
    use Ecto.Migration

    def change do
        create table(:request_status_history) do
          add :request_id, references(:trailer_requests, on_delete: :delete_all), null: false
          add :request_status_id, references(:request_trailer_service_status_type, on_delete: :delete_all), null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :driver_id, references(:users, on_delete: :delete_all)
          add :picked_up_pallet_count, :integer
          add :delivered_pallet_count, :integer
          add :picked_up_blue_bin_count, :integer
          add :delivered_blue_bin_count, :integer
          add :picked_up_gaylord_count, :integer
          add :delivered_gaylord_count, :integer
          add :delivered_new_goods, :integer
          add :picked_up_large_item_count, :integer
          add :user_estimated_delivery_at, :utc_datetime
          add :system_estimated_delivery_at, :utc_datetime
          add :delivered_at, :utc_datetime
          add :accepted_by_store_representative, :string, size: 50

        timestamps(type: :timestamptz)
      end

      
      create index(:request_status_history, [:driver_id])  
      create index(:request_status_history, [:request_id])
      create index(:request_status_history, [:request_status_id])
      create index(:request_status_history, [:user_id])

    end

  end
