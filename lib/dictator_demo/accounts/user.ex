defmodule DictatorDemo.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import DictatorDemo.Accounts.Crypto.Changeset

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :name, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password, :password_confirmation, :email])
    |> validate_required([:name, :password, :password_confirmation, :email])
    |> validate_confirmation(:password)
    |> put_encrypted_password()
    |> unique_constraint(:email)
  end
end
