defmodule DictatorDemoWeb.Router do
  use DictatorDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug DictatorDemoWeb.Auth.Pipelines.EnsureAuthenticated
  end

  pipeline :noauth do
    plug DictatorDemoWeb.Auth.Pipelines.EnsureUnauthenticated
  end

  scope "/", DictatorDemoWeb do
    pipe_through [:browser]

    get "/", PageController, :index

    get "/users/new", UserController, :new
    post "/users", UserController, :create

    get "/sign_in", SessionController, :new
    post "/sign_in", SessionController, :create
  end

  scope "/", DictatorDemoWeb do
    pipe_through [:browser, :auth]

    resources "/users", UserController, except: [:new, :create]
    resources "/posts", PostController
  end
end
