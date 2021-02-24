# rocketpay

NLW#4 RocketSeat
https://nextlevelweek.com/episodios/elixir/1/edicao/4
https://elixir-lang.org/

## Class 1

- `make run-postgres` to get up a database
- `make debug` to create a container with elixir
- `mix archive.install hex phx_new 1.5.7` to install phoenix web framework
- `mix phx.new rocketpay --no-webpack --no-html` to initialize a phx project

Now `/rocketpay` folder it's the work directory

- check database credentials and address at `./config/dev.exs` and at `./config/test.exs`
- `mix ecto.setup` to check connection wih db
- add `{:credo, "~> 1.5", only: [:dev, :test], runtime: false}` to `./mix.exs` on dep section
- `mix deps.get` to dowload dependencies and then `mix credo gen.config` to build credo config

Run server

- `mix phx.server` and access `http://172.17.0.4:4000/dashboard/home` and monitorring

Phx setup organization

- `./lib/<APP_NAME>/` code the business rules, connection with db, ...
- `./lib/<APP_NAME>_web/` code the web view, controller, routers, ...

## TODO

- https://cult.honeypot.io/originals/elixir-the-documentary
- https://youtu.be/EXE7NUxBKrk
- https://youtu.be/bk3icU8iIto
