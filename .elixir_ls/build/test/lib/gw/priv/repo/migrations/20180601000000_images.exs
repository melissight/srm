defmodule GW.Repo.Migrations.Images do
    use Ecto.Migration

    def change do
        create table(:images, primary_key: false) do
          add :image_guid, :string, size: 255, primary_key: true, null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :image_type_id, references(:image_type, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:images, [:user_id])
      create index(:images, [:image_type_id])

    end

  end
