defmodule GW.Repo.Migrations.RequestTrailerInspection do
    use Ecto.Migration

      def change do
        create table(:request_trailer_inspection, primary_key: false) do
          add :request_id, references(:requests, on_delete: :delete_all), primary_key: true, null: false
          add :inspection_type_id, references(:request_trailer_inspection_type, on_delete: :delete_all), null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :preferred_vendor_location_id, references(:locations, on_delete: :delete_all)
          add :due_on, :date, null: false
          timestamps(type: :timestamptz)
      end

        create index(:request_trailer_inspection, [:preferred_vendor_location_id])
        create index(:request_trailer_inspection, [:request_id])
        create index(:request_trailer_inspection, [:inspection_type_id])
        create index(:request_trailer_inspection, [:user_id])
        create index(:request_trailer_inspection, [:trailer_id])
  end

 end



