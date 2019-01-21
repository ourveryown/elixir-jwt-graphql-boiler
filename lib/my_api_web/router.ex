defmodule MyApiWeb.Router do
  use MyApiWeb, :router

  alias MyApi.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/" do
    pipe_through(:api)
    forward("/api", Absinthe.Plug, schema: MyApi.Schema)
    forward(
      "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: MyApi.Schema
    )
  end
end
