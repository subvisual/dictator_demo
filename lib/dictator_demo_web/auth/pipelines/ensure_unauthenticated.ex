defmodule DictatorDemoWeb.Auth.Pipelines.EnsureUnauthenticated do
  use Guardian.Plug.Pipeline, otp_app: :dictator_demo

  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.VerifyCookie
  plug Guardian.Plug.EnsureNotAuthenticated
end
