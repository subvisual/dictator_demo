defmodule DictatorDemo.Accounts.Crypto.Changeset do
  import Ecto.Changeset

  alias DictatorDemo.Accounts.Crypto.Password

  def put_encrypted_password(changeset) do
    case get_change(changeset, :password) do
      nil ->
        changeset

      password ->
        encrypted_password = Password.encrypt(password)
        put_change(changeset, :encrypted_password, encrypted_password)
    end
  end

  def validate_encrypted_password(changeset) do
    case get_field(changeset, :encrypted_password) do
      nil ->
        changeset

      encrypted_password ->
        verify_encrypted_password(changeset, encrypted_password)
    end
  end

  defp verify_encrypted_password(changeset, encrypted_password) do
    validate_change(changeset, :password, fn :password, password ->
      if Password.verify(password, encrypted_password) do
        []
      else
        [password: "invalid password"]
      end
    end)
  end
end
