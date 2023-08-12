# ConvertId

Detects a UUID or ULID and converts between those types.

## Examples

    > ./convert_id 0189d0ae-9b6c-64e8-8379-e9b2480d443a
    01H78AX6VCCKM86YF9P940TH1T

    > ./convert_id 01H78AX6VCCKM86YF9P940TH1T
    0189d0ae-9b6c-64e8-8379-e9b2480d443a

    > ./convert_id abc123
    Cannot detect type

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `convert_id` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:convert_id, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/convert_id>.

