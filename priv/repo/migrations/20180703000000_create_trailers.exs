defmodule SRM.Repo.Migrations.CreateTrailers do
    use Ecto.Migration
  
    def change do
        create table(:trailers) do
          add :current_location_id, references(:locations, on_delete: :delete_all), null: false
          add :current_trailer_status_id, references(:trailer_status, on_delete: :delete_all), null: false
          add :unit_number, :string, size: 20, null: false
          add :length_in_inches, :integer, null: false
          add :height_in_inches, :integer, null: false
          add :trailer_owner_id, references(:trailer_owner, on_delete: :delete_all), null: false
          add :current_trailer_content_id, references(:trailer_content_type, on_delete: :delete_all), null: false
          add :has_decal, :boolean, null: false
          add :has_etracks, :boolean, null: false
          add :has_warning_strips, :boolean, null: false
          add :has_lift_gate, :boolean, null: false
          add :door_type_id, references(:trailer_door_type, on_delete: :delete_all)
          add :model_year, :integer, null: false
          add :trailer_make_id, references(:trailer_make, on_delete: :delete_all), null: false
          add :serial_number, :string, size: 75, null: false
          add :tag_number, :string, size: 20, null: false
        timestamps(type: :timestamptz)  
    end

    create index(:trailers, [:current_location_id])
    create index(:trailers, [:current_trailer_status_id])
    create index(:trailers, [:trailer_owner_id])
    create index(:trailers, [:current_trailer_content_id])
    create index(:trailers, [:door_type_id])
    create index(:trailers, [:trailer_make_id])
   
  end
  
end