defmodule GW.Repo.Migrations.BoardsUsers do
  use Ecto.Migration

  def change do
    create table(:boards_users) do
      add :board_id, references(:workspaces_boards, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:boards_users, [:board_id])
    create index(:boards_users, [:user_id])
  end
end
