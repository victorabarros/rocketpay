defmodule Rocketpay.Repo.Migrations.CreateAccountsTable do
  use Ecto.Migration

  def change do
    create table :accounts do
      add :balance, :decimal
      add :user_id, :string

      timestamps()
  end

  create constraint(:accounts, :balance_cant_be_negative, check: "balance >= 0")
end
