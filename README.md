# rocketpay

NLW#4 RocketSeat
https://nextlevelweek.com/episodios/elixir/1/edicao/4
https://elixir-lang.org/

## Class 1

### Setuping

- `make run-postgres` to get up a database
- `make debug` to create a container with elixir
- `docker exec -it rocketpay` | now `make debug` works too
- `mix archive.install hex phx_new 1.5.7` to install phoenix web framework
- `mix phx.new rocketpay --no-webpack --no-html` to initialize a phx project

Now `/rocketpay` folder it's the work directory

- check database credentials and address at `./config/dev.exs` and at `./config/test.exs`
- `mix ecto.setup` to check connection wih db
- add `{:credo, "~> 1.5", only: [:dev, :test], runtime: false}` to `./mix.exs` on dep section
- `mix deps.get` to dowload dependencies and then `mix credo gen.config` to build credo config

### Developing server

- `mix phx.server` and access `http://localhost:4000/dashboard/home` and monitorring
- Phx setup contexts
  - `./lib/<APP_NAME>/` code the business rules, connection with db, ...
  - `./lib/<APP_NAME>_web/` code the web view, controller, routers, ...
- `http://localhost:4000/api/:filename` to sum the content of the file

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

### Testing

`mix test`

## Class 2

Ecto it's the framework to deal with databases

- `mix ecto.create` initialize
- `mix ecto.gen.migration create_user_table` and write the migration on `./priv/repo/migrations/[DATETIME]_create_user_table.exs`
- `mix ecto.migrate` to run migration
- `mix ecto.drop` drop database

```bash
iex(1)> alias Rocketpay.User
Rocketpay.User
iex(2)> User.changeset(%{name: "vtr", password: "123456", email: "v@a", nickname: "v", age: 23})
#Ecto.Changeset<
  action: nil,
  changes: %{
    age: 23,
    email: "v@a",
    name: "vtr",
    nickname: "v",
    password: "123456",
    password_hash: "$2b$12$Zm5Iiy3lauYv1/DUI4tRN.dni8ucWN7wnQZI4PjiummUOkVSDj4BK"
  },
  errors: [],
  data: #Rocketpay.User<>,
  valid?: true
iex(3)> recompile
iex(4)> Rocketpay.create_user(%{name: "vtr", age: 23, email: "vf@re.com", password: "159487", nickname: "fdse"})
[debug] QUERY OK db=1.5ms decode=0.8ms queue=0.4ms idle=1069.2ms
INSERT INTO "users" ("age","email","name","nickname","password_hash","inserted_at","updated_at","id") VALUES ($1,$2,$3,$4,$5,$6,$7,$8) [23, "vf@re.com", "vtr", "fdse", "$2b$12$u2fsYMjVhr.uuyk/s3A6rusmUdAhW6soC.yyOfyY8XaIxbKdLWrFm", ~N[2021-02-25 03:19:07], ~N[2021-02-25 03:19:07], <<224, 134, 116, 120, 21, 57, 64, 214, 172, 147, 200, 77, 224, 189, 163, 107>>]
{:ok,
 %Rocketpay.User{
   __meta__: #Ecto.Schema.Metadata<:loaded, "users">,
   age: 23,
   email: "vf@re.com",
   id: "e0867478-1539-40d6-ac93-c84de0bda36b",
   inserted_at: ~N[2021-02-25 03:19:07],
   name: "vtr",
   nickname: "fdse",
   password: "159487",
   password_hash: "$2b$12$u2fsYMjVhr.uuyk/s3A6rusmUdAhW6soC.yyOfyY8XaIxbKdLWrFm",
   updated_at: ~N[2021-02-25 03:19:07]
 }}
iex(5)>
```

## Class 3

- Rocketpay.Repo it's the layer that connect with DB
- To see docs, on interactive mode run `h Rocketpay.Repo.all`, or access `https://hexdocs.pm/ecto/Ecto.Repo.html`
  - Ex: `Rocketpay.Repo.all(Rocketpay.User)`

## TODO

- https://cult.honeypot.io/originals/elixir-the-documentary
- https://youtu.be/EXE7NUxBKrk
- https://youtu.be/bk3icU8iIto
