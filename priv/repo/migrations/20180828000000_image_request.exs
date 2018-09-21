defmodule GW.Repo.Migrations.ImageRequest do
    use Ecto.Migration
  
    def change do
        create table(:image_request) do
          add :image_guid, references(:images, column: :image_guid, type: :string, on_delete: :delete_all), null: false
          add :request_id, references(:requests, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:image_request, [:image_guid])
    create index(:image_request, [:request_id])

  end
  
end
