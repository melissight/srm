defmodule GW.Repo.Migrations.HistoryAdcTrailerStatus do
    use Ecto.Migration

    def change do
        create table(:history_adc_trailer_status) do
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :percent_full, :integer, null: false
          add :donation_count, :integer, null: false
          add :captured_at, :utc_datetime, null: false
          add :user_id, references(:users, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:history_adc_trailer_status, [:trailer_id])
      create index(:history_adc_trailer_status, [:user_id])

    end
  end
