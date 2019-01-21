defmodule MyApi.GraphQL.Helper do
  def format_error(error) when is_atom(error) do
    {:error, error}
  end

  # TODO: clean up, data coming through may not actually be a real changeset,
  # but a struct with and `errors` key. See lib/classsolver_api/schools/students.ex
  def format_error(%{errors: _} = changeset) do
    errors =
      changeset.errors
      |> Enum.map(fn {key, {value, context}} ->
        details =
          context
          |> Enum.map(fn {a, b} ->
            %{"#{a}": b}
          end)

        [message: "#{key} #{value}", details: inspect(details)]
      end)

    {:error, errors}
  end

  def format_error(error), do: {:error, error}
end
