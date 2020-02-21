defmodule DictatorDemo.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias DictatorDemo.Accounts.User

  schema "posts" do
    field :body, :string
    field :title, :string

    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :title, :user_id])
    |> validate_required([:body, :title, :user_id])
  end
end
