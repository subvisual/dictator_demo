{:ok, foo} =
  DictatorDemo.Accounts.create_user(%{
    name: "Foo",
    email: "foo@example.org",
    password: "123",
    password_confirmation: "123"
  })

{:ok, bar} =
  DictatorDemo.Accounts.create_user(%{
    name: "Bar",
    email: "bar@example.org",
    password: "123",
    password_confirmation: "123"
  })

DictatorDemo.Blog.create_post(%{
  title: "this should be seen",
  body: "this should be seen",
  user_id: foo.id
})

DictatorDemo.Blog.create_post(%{
  title: "this should NOT be seen",
  body: "only on index",
  user_id: bar.id
})
