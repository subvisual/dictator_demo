defmodule DictatorDemo.Repo.Migrations.EnableCiTextExtension do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION citext", "DROP EXTENSION citext")
  end
end
