defmodule DictatorDemo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string, null: false)
      add(:encrypted_password, :string, null: false)
      add(:email, :citext, null: false)

      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
