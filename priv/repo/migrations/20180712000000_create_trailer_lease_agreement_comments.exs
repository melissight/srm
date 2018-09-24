defmodule SRM.Repo.Migrations.CreateTrailerLeaseAgreementComments do
    use Ecto.Migration

    def change do
      create table(:trailer_lease_agreement_comments) do
        add :trailer_request_id, references(:users, on_delete: :delete_all), null: false
        add :user_id, references(:users, on_delete: :delete_all), null: false
        add :comment_text, :string, size: 750, null: false
      timestamps(type: :timestamptz)
      end

      create index(:trailer_lease_agreement_comments, [:trailer_request_id])
      create index(:trailer_lease_agreement_comments, [:user_id])
    end

  end
