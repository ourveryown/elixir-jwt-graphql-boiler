defmodule MyApi.Schema.AccountsTypes do
  use Absinthe.Schema.Notation

  object :user do
    field(:id, :id)
    field(:email, :string)
  end

  object :session do
    field(:token, :string)
    field(:user, :user)
  end

  object :account_queries do
    field :users, list_of(:user) do
      resolve(&MyApi.Resolvers.AccountResolver.get_all_users/3)
    end
  end

  object :account_mutations do
    field :login, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&MyApi.Resolvers.AccountResolver.login/3)
    end
  end
end
