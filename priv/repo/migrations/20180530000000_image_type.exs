defmodule GW.Repo.Migrations.ImageType do
    use Ecto.Migration
  
    def change do
      create table(:image_type) do
        add :image_type_name, :string, size: 75
      timestamps(type: :timestamptz)
    end

  end
  
end
