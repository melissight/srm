defmodule SRM.Repo.Migrations.CreateAdcTrailerProgressHistory do
    use Ecto.Migration
     
  def change do
    create table(:adc_trailer_progress_history) do
      add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
      add :percent_full, :integer, null: false
      add :donation_count, :integer, null: false
      add :image_id, references(:images, on_delete: :delete_all), null: false
      add :captured_at, :utc_datetime, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
    timestamps(type: :timestamptz)
  end

  create index(:adc_trailer_progress_history, [:trailer_id])
  create index(:adc_trailer_progress_history, [:image_id])
  create index(:adc_trailer_progress_history, [:user_id])

  end
end