defmodule GW.Repo.Migrations.Routes do
    use Ecto.Migration

      def change do
        create table(:routes) do
          add :driver_id, references(:users, on_delete: :delete_all), null: false
          add :planned_start_at, :utc_datetime, null: false
          add :planned_end_at, :utc_datetime, null: false
          add :actual_start_at, :utc_datetime, null: false
          add :actual_end_at, :utc_datetime, null: false
          add :starting_trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :actual_starting_odometer, :"double precision"
          add :route_comment_id, references(:comments, on_delete: :delete_all)
          add :created_by_user_id, references(:users, on_delete: :delete_all), null: false
         timestamps(type: :timestamptz)
      end

      create index(:routes, [:driver_id])
      create index(:routes, [:starting_trailer_id])
      create index(:routes, [:route_comment_id])
      create index(:routes, [:created_by_user_id])

    end

end
