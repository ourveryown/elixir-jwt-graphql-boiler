defmodule MyApi.Schema do
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(__MODULE__.AccountsTypes)

  # queries
  query do
    import_fields(:account_queries)
  end

  # mutations
  mutation do
    import_fields(:account_mutations)
  end
end
