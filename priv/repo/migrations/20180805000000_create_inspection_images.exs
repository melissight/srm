defmodule SRM.Repo.Migrations.CreateInspectionImages do
    use Ecto.Migration

    def change do
      create table(:inspection_images) do
        add :inspection_id, references(:inspections, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :inspection_image_id, references(:images, on_delete: :delete_all)
      timestamps(type: :timestamptz)
    end

    create index(:inspection_images, [:inspection_id])
    create index(:inspection_images, [:user_id])
    create index(:inspection_images, [:inspection_image_id])

  end

end
