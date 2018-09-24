defmodule SRM.Repo.Migrations.CreateUnintendedDonationStatusType do
    use Ecto.Migration
  
    def change do
      create table(:unintended_donation_status_type) do
        add :unintended_donation_status_type_name, :string, size: 75, null: false
      timestamps(type: :timestamptz)
    end

  end
  
end