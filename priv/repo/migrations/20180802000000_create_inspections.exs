defmodule SRM.Repo.Migrations.CreateInspections do
    use Ecto.Migration

      def change do
        create table(:inspections) do
          add :inspection_type_id, references(:inspection_type, on_delete: :delete_all), null: false
          add :requested_by_user_id, references(:users, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
          add :due_on, :date, null: false
          add :inspection_status_type, references(:inspection_status_type, on_delete: :delete_all), null: false
          timestamps(type: :timestamptz)
      end

        create index(:inspections, [:preferred_vendor_location_id])
        create index(:inspections, [:inspection_type_id])
        create index(:inspections, [:requested_by_user_id])
        create index(:inspections, [:trailer_id])
        create index(:inspections, [:inspection_status_type])
  end

 end



