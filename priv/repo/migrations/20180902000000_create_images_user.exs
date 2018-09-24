defmodule SRM.Repo.Migrations.CreateImagesUser do
    use Ecto.Migration

    def change do
        create table(:images_user) do
          add :image_id, references(:images, on_delete: :delete_all), null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:images_user, [:image_id])
      create index(:images_user, [:user_id])

    end

  end
