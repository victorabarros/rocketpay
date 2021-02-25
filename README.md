# rocketpay

NLW#4 RocketSeat
https://nextlevelweek.com/episodios/elixir/1/edicao/4
https://elixir-lang.org/

## Class 1

### Setuping

- `make run-postgres` to get up a database
- `make debug` to create a container with elixir
- `mix archive.install hex phx_new 1.5.7` to install phoenix web framework
- `mix phx.new rocketpay --no-webpack --no-html` to initialize a phx project

Now `/rocketpay` folder it's the work directory

- check database credentials and address at `./config/dev.exs` and at `./config/test.exs`
- `mix ecto.setup` to check connection wih db
- add `{:credo, "~> 1.5", only: [:dev, :test], runtime: false}` to `./mix.exs` on dep section
- `mix deps.get` to dowload dependencies and then `mix credo gen.config` to build credo config

### Developing server

- `mix phx.server` and access `http://172.17.0.4:4000/dashboard/home` and monitorring
- Phx setup contexts
  - `./lib/<APP_NAME>/` code the business rules, connection with db, ...
  - `./lib/<APP_NAME>_web/` code the web view, controller, routers, ...
- `http://172.17.0.4:4000/api/:filename` to sum the content of the file

### Interative

- `iex -S mix` interative elixir with root project availables to import
  - `recompile` to refresh project

```bash
root@81e4507c9b11:/srv/rocketpay/rocketpay# iex -S mix
Erlang/OTP 23 [erts-11.1.8] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Compiling 1 file (.ex)
warning: variable "file" is unused (if the variable is not meant to be used, prefix it with an underscore)
  lib/rocketpay/numbers.ex:3: Rocketpay.Numbers.sumfrom_file/1

Generated rocketpay app
Interactive Elixir (1.11.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Rocketpay.Numbers.sumfrom_file("numbers")
{:ok, "1,2,3,4,8,9,10\n"}
iex(1)> Rocketpay.Numbers.sumfrom_file("numbers")
{:ok, "1,2,3,4,8,9,10\n"}
iex(2)> recompile
Compiling 1 file (.ex)
warning: variable "file" is unused (if the variable is not meant to be used, prefix it with an underscore)
  lib/rocketpay/numbers.ex:3: Rocketpay.Numbers.sum_from_file/1

:ok
iex(3)> Rocketpay.Numbers.sum_from_file("numbers")
"1,2,3,4,8,9,10\n"
iex(4)> Rocketpay.Numbers.sum_from_file("numbersr")
{:error, "Invalid file!"}
iex(6)> recompile
Compiling 1 file (.ex)
warning: variable "file" is unused (if the variable is not meant to be used, prefix it with an underscore)
  lib/rocketpay/numbers.ex:3: Rocketpay.Numbers.sum_from_file/1

:ok
iex(7)> Rocketpay.Numbers.sum_from_file_with_pipe_operator("numbers")
iex(11)> alias Rocketpay.Numbers, as: Fun
Rocketpay.Numbers
iex(12)> Fun.sum_from_file("numbers")
{:ok, %{result: 37}}
```

### Tests

`mix test`

## TODO

- https://cult.honeypot.io/originals/elixir-the-documentary
- https://youtu.be/EXE7NUxBKrk
- https://youtu.be/bk3icU8iIto
