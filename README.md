# rocketpay

NLW#4 RocketSeat
https://nextlevelweek.com/episodios/elixir/1/edicao/4
https://elixir-lang.org/

## 1

- run `make run-postgres` to get up a database
- run `make debug` to create a container with elixir
- run `mix archive.install hex phx_new 1.5.7` to install phoenix web framework
- run `mix phx.new rocketpay --no-webpack --no-html` to initialize a phx project

Inside `/rocketpay` folder

- check database credentials and address at `./config/dev.exs` and at `./config/test.exs`
- run `mix ecto.setup` to check connection wih db
- add `{:credo, "~> 1.5", only: [:dev, :test], runtime: false}` to `./mix.exs` on dep section
- run `mix deps.get` to dowload dependencies and then `mix credo gen.config` to build credo config

## TODO

- https://cult.honeypot.io/originals/elixir-the-documentary
- https://youtu.be/EXE7NUxBKrk
- https://youtu.be/bk3icU8iIto
