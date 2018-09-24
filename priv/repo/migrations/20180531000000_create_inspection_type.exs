defmodule SRM.Repo.Migrations.CreateInspectionType do
    use Ecto.Migration
  
    def change do
        create table(:inspection_type) do
          add :inspection_type_name, :string, size: 75, null: false
        timestamps(type: :timestamptz)
    end

  end
  
end