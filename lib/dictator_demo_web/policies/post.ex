defmodule DictatorDemoWeb.Policies.Post do
  alias DictatorDemo.Blog.Post

  use Dictator.Policies.Standard, for: Post
end
