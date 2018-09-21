defmodule GW.Repo.Migrations.Permissions do
  use Ecto.Migration

  def change do
    create table(:permissions) do
      add :permission_type, :string, size: 75, null: false
    timestamps(type: :timestamptz)
  end
end

end
