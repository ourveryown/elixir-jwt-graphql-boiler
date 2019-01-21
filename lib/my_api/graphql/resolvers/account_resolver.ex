defmodule MyApi.Resolvers.AccountResolver do
  alias MyApi.Services.AccountService

  def get_all_users(_,_,_) do
    {:ok, AccountService.get_all_users()}
  end

  def login(_, %{email: email, password: password}, _) do
    {:ok, AccountService.login(email, password)}
  end
end
