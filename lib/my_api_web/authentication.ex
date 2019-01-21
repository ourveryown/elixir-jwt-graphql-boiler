defmodule MyApiWeb.Authentication do
  @user_salt "goliath"

  def sign(data) do
    Phoenix.Token.sign(MyApiWeb.Endpoint, @user_salt, data)
  end

  def verify(token) do
    Phoenix.Token.verify(MyApiWeb.Endpoint, @user_salt, token, max_age: 86_400)
  end
end
