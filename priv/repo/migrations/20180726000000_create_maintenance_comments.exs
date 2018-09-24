defmodule SRM.Repo.Migrations.CreateMaintenanceComments do
    use Ecto.Migration

    def change do
      create table(:maintenance_comments) do
        add :maintenance_order_id, references(:maintenance_orders, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestamps(type: :timestamptz)
      end

      create index(:maintenance_comments, [:maintenance_order_id])
      create index(:maintenance_comments, [:user_id])
    end

  end
