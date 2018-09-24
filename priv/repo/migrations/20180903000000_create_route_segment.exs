defmodule SRM.Repo.Migrations.CreateRouteSegments do
    use Ecto.Migration
  
    def change do
      create table(:route_segments) do
        add :route_id, references(:routes, on_delete: :delete_all), null: false
        add :sequence_number, :integer, null: false
        add :request_id, references(:trailer_requests, on_delete: :delete_all), null: false
        add :planned_pick_up_at, :utc_datetime, null: false
        add :from_location_id, references(:locations, on_delete: :delete_all), null: false
        add :planned_drop_off_at, :utc_datetime, null: false
        add :to_location_id, references(:locations, on_delete: :delete_all), null: false
        add :actual_picked_up_at, :utc_datetime, null: false
        add :actual_dropped_off_at, :utc_datetime, null: false
        add :actual_ending_odometer, :"double precision"
      timestamps(type: :timestamptz)
    end

    create index(:route_segments, [:route_id])
    create index(:route_segments, [:request_id])
    create index(:route_segments, [:from_location_id])
    create index(:route_segments, [:to_location_id])
    
  end
end