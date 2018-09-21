defmodule GW.Repo.Migrations.Comments do
    use Ecto.Migration

    def change do
      create table(:comments) do
        add :comment_type_id, references(:comment_type, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestamps(type: :timestamptz)
      end

      create index(:comments, [:comment_type_id])
      create index(:comments, [:user_id])
    end

  end
