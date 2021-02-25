defmodule Rocketpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table :users do
      # :id is implicit as integer
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :nickname, :string

      timestamps()  # Add created_at and updated_at
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
