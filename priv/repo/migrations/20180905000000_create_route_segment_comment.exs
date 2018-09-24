defmodule SRM.Repo.Migrations.CreateRouteSegmentComments do
    use Ecto.Migration

    def change do
      create table(:route_segment_comments) do
        add :route_segment_id, references(:route_segments, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestamps(type: :timestamptz)
      end

      create index(:route_segment_comments, [:route_segment_id])
      create index(:route_segment_comments, [:user_id])
    end

  end
