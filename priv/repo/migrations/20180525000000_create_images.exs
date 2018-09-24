defmodule SRM.Repo.Migrations.CreateImages do
    use Ecto.Migration

    def change do
        create table(:images) do
          add :image_guid, :string, size: 255, null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:images, [:user_id])

    end

  end
