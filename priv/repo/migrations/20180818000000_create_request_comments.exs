defmodule SRM.Repo.Migrations.CreateRequestComments do
    use Ecto.Migration

    def change do
      create table(:request_comments) do
        add :trailer_request_id, references(:users, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestamps(type: :timestamptz)
      end

      create index(:request_comments, [:trailer_request_id])
      create index(:request_comments, [:user_id])
    end

  end
