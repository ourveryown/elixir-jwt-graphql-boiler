defmodule MyApi.Services.AccountService do
  alias MyApi.Accounts.Accounts

  def get_all_users() do
    Accounts.list_users()
  end

  def login(email, password) do
    Accounts.token_sign_in(email, password)
  end
end
