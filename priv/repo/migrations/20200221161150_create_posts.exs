defmodule DictatorDemo.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:body, :text)
      add(:title, :string)
      add(:user_id, :integer)

      timestamps()
    end

    create(index(:posts, [:user_id]))
  end
end
