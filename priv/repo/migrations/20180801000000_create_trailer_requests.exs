defmodule SRM.Repo.Migrations.CreateTrailerRequests do
    use Ecto.Migration

    def change do
      create table(:trailer_requests) do
        add :location_id, references(:locations, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :requested_delivery_on, :date, null: false
        add :requested_time_of_day_id, references(:time_of_day, on_delete: :delete_all)
        add :requested_delivery_from, :utc_datetime
        add :requested_delivery_to, :utc_datetime
        add :request_out_pallet_count, :integer, null: false
        add :request_in_pallet_count, :integer, null: false
        add :requested_out_blue_bin_count, :integer, null: false
        add :requested_in_blue_bin_count, :integer, null: false
        add :requested_out_gaylord_count, :integer, null: false
        add :requested_in_gaylord_count, :integer, null: false
        add :requested_in_new_goods, :integer, null: false
        add :requested_out_large_item_count, :integer, null: false
      timestamps(type: :timestamptz)
    end

    create index(:trailer_requests, [:location_id])
    create index(:trailer_requests, [:user_id])
    create index(:trailer_requests, [:requested_time_of_day_id])

  end

end
