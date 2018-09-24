defmodule SRM.Repo.Migrations.CreateUnintendedDonationInquiry do
    use Ecto.Migration

    def change do
        create table(:unintended_donation_inquiry) do
          add :location_id, references(:locations, on_delete: :delete_all), null: false
          add :donor_id, references(:users, on_delete: :delete_all), null: false
          add :donated_at, :utc_datetime, null: false
          add :trailer_percent_full_estimate, :integer, null: false
          add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
          add :entered_by_user_id, references(:users, on_delete: :delete_all), null: false
          add :entered_at, :utc_datetime, null: false
          add :reported_by_user_id, references(:users, on_delete: :delete_all), null: false
          add :dsc, :string, size: 750, null: false
          add :current_unintended_donation_status_id, references(:unintended_donation_status_type, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

    create index(:unintended_donation_inquiry, [:donor_id])
    create index(:unintended_donation_inquiry, [:location_id])
    create index(:unintended_donation_inquiry, [:trailer_id])
    create index(:unintended_donation_inquiry, [:entered_by_user_id])
    create index(:unintended_donation_inquiry, [:reported_by_user_id])
    create index(:unintended_donation_inquiry, [:current_unintended_donation_status_id])

  end

end
