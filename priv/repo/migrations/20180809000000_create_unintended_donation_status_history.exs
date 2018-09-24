defmodule SRM.Repo.Migrations.CreateUnintendedDonationStatusHistory do
    use Ecto.Migration

    def change do
        create table(:unintended_donation_status_history) do
          add :unintended_donation_id, references(:unintended_donation_inquiry, on_delete: :delete_all), null: false
          add :updated_by_user_id, references(:users, on_delete: :delete_all), null: false
          add :location_id, references(:locations, on_delete: :delete_all), null: false 
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :found_at, :utc_datetime
          add :returned_at, :utc_datetime
          add :current_unintended_donation_status_id, references(:unintended_donation_status_type, on_delete: :delete_all), null: false

        timestamps(type: :timestamptz)
      end

      create index(:unintended_donation_status_history, [:unintended_donation_id])
      create index(:unintended_donation_status_history, [:location_id])
      create index(:unintended_donation_status_history, [:trailer_id])
      create index(:unintended_donation_status_history, [:current_unintended_donation_status_id])

    end

  end
