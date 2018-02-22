# Restaurant

An Elixir implementation of the CQRS example - restaurant. See [Ruby implementation here](https://github.com/hannakalinowska/restaurant/) - where we knew what we were doing.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `restaurant` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:restaurant, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/restaurant](https://hexdocs.pm/restaurant).

## Notes

### Compilation

Use the `Makefile`:
```sh
make
```
Or don't:

```sh
mix compile
mix escript.build
```

### Run tests

Use the `Makefile`:
```sh
make test
```
Or don't:
```sh
mix test
```

### Run code

```sh
./restaurant
```

### Run console

Use the `Makefile`:
```sh
make console
```
Or don't:
```sh
iex -S mix
```
