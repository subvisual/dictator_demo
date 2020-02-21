{:ok, mendes} =
  DictatorDemo.Accounts.create_user(%{
    name: "Mendes",
    email: "mendes@subvisual.com",
    password: "123",
    password_confirmation: "123"
  })

{:ok, fernando} =
  DictatorDemo.Accounts.create_user(%{
    name: "Mendes",
    email: "fernando@subvisual.com",
    password: "123",
    password_confirmation: "123"
  })

DictatorDemo.Blog.create_post(%{
  title: "this should be seen",
  body: "this should be seen",
  user_id: mendes.id
})

DictatorDemo.Blog.create_post(%{
  title: "this should NOT be seen",
  body: "only on index",
  user_id: fernando.id
})
