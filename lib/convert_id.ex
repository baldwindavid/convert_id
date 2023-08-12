defmodule ConvertId do
  alias Ecto.ULID
  alias Ecto.UUID

  @doc """
  Detects a UUID or ULID and converts between those types.

  ## Examples

      > ./convert_id 0189d0ae-9b6c-64e8-8379-e9b2480d443a
      01H78AX6VCCKM86YF9P940TH1T

      > ./convert_id 01H78AX6VCCKM86YF9P940TH1T
      0189d0ae-9b6c-64e8-8379-e9b2480d443a

      > ./convert_id abc123
      Cannot detect type
  """
  def main([value]) do
    with {:ok, convert_fn} <- detect_type(value) do
      case convert_fn.(value) do
        {:ok, converted_value} ->
          IO.puts(converted_value)

        :error ->
          handle_failure("Cannot convert value")
      end
    end
  end

  defp detect_type(value) do
    cond do
      is_uuid?(value) ->
        {:ok, &uuid_to_ulid/1}

      is_ulid?(value) ->
        {:ok, &ulid_to_uuid/1}

      true ->
        handle_failure("Cannot detect type")
    end
  end

  defp handle_failure(msg) do
    IO.puts(msg)
    System.halt(1)
  end

  defp uuid_to_ulid(uuid_str) do
    with {:ok, uuid_bin} <- UUID.dump(uuid_str) do
      ULID.load(uuid_bin)
    end
  end

  defp ulid_to_uuid(ulid_str) do
    with {:ok, ulid_bin} <- ULID.dump(ulid_str) do
      UUID.load(ulid_bin)
    end
  end

  defp is_uuid?(value) do
    Regex.match?(~r/^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$/i, value)
  end

  defp is_ulid?(value) do
    Regex.match?(~r/^[0-9A-Z]{26}$/i, value)
  end
end
