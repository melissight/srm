defmodule SRM.Repo.Migrations.CreateLocations do
    use Ecto.Migration

    def change do
        create table(:locations) do
          add :region_id, references(:region, on_delete: :delete_all), null: false
          add :location_type_id, references(:location_type, on_delete: :delete_all), null: false
          add :location_name, :string, size: 100, null: false
          add :latitude, :"double precision", null: false
          add :longitude, :"double precision", null: false
          add :time_zone_id, references(:time_zone, on_delete: :delete_all), null: false
          add :is_open_saturday, :boolean, null: false
          add :is_open_sunday, :boolean, null: false
          add :has_good_finders, :boolean, null: false
          add :address_line_1, :string, size: 100, null: false
          add :address_line_2, :string, size: 100
          add :city, :string, size: 75, null: false
          add :state, :string, size: 75, null: false
          add :zip, :string, size: 10, null: false
          add :primary_contact_name, :string, size: 100
          add :phone, :string, size: 25
        timestamps(type: :timestamptz)
    end

    create index(:locations, [:region_id])
    create index(:locations, [:location_type_id])
    create index(:locations, [:time_zone_id])


  end

end
