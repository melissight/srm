defmodule SRM.Repo.Migrations.CreateInspectionComments do
    use Ecto.Migration

    def change do
      create table(:inspection_comments) do
        add :inspection_id, references(:inspections, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestamps(type: :timestamptz)
      end

      create index(:inspection_comments, [:inspection_id])
      create index(:inspection_comments, [:user_id])
    end

  end
