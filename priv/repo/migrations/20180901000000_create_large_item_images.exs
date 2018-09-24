defmodule SRM.Repo.Migrations.CreateLargeItemImages do
    use Ecto.Migration
  
    def change do
        create table(:large_item_images) do
          add :image_id, references(:images, on_delete: :delete_all), null: false
          add :request_id, references(:trailer_requests, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:large_item_images, [:image_id])
    create index(:large_item_images, [:request_id])

  end
  
end
