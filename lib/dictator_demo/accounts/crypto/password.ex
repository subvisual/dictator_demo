defmodule DictatorDemo.Accounts.Crypto.Password do
  import Argon2, only: [hash_pwd_salt: 1, verify_pass: 2]

  def verify(password, hashed_password),
    do: verify_pass(password, hashed_password)

  def encrypt(nil),
    do: nil

  def encrypt(password),
    do: password |> String.trim() |> encrypt_trimmed()

  defp encrypt_trimmed(""), do: nil
  defp encrypt_trimmed(password), do: hash_pwd_salt(password)
end
