defmodule GW.Repo.Migrations.UserAddress do
    use Ecto.Migration
  
    def change do
        create table(:user_address) do
          add :user_id, references(:users, on_delete: :delete_all), null: false
          add :address_id, references(:address, on_delete: :delete_all), null: false
        timestamps(type: :timestamptz)
      end

      create index(:user_address, [:user_id])
      create index(:user_address, [:address_id])
      
    end
    
  end