defmodule DictatorDemoWeb.Auth do
  use Guardian, otp_app: :dictator_demo

  alias DictatorDemo.Accounts

  def subject_for_token(%Accounts.User{id: id}, _claims),
    do: {:ok, "user-#{id}"}

  def subject_for_token(_, _), do: {:error, :invalid_subject}

  def resource_from_claims(claims) do
    "user-" <> id = claims["sub"]

    resource =
      id
      |> String.to_integer()
      |> Accounts.get_user!()

    {:ok, resource}
  end
end
