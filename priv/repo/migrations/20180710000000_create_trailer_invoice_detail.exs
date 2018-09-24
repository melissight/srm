defmodule SRM.Repo.Migrations.CreateTrailerInvoiceDetail do
    use Ecto.Migration
  
    def change do
        create table(:trailer_invoice_detail) do
            add :image_id, references(:images, on_delete: :delete_all), null: false
            add :invoice_number, :string, size: 75, null: false
            add :invoice_date, :date, null: false
            add :invoice_total, :"double precision", null: false
            add :vendor_id, references(:locations, on_delete: :delete_all), null: false
            add :trailer_id, references(:trailers, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
    end

        create index(:trailer_invoice_detail, [:vendor_id])
        create index(:trailer_invoice_detail, [:image_id])
        create index(:trailer_invoice_detail, [:trailer_id])

  end
  
end
