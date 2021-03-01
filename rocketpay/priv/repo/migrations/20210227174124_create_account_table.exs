defmodule Rocketpay.Repo.Migrations.CreateAccountTable do
  use Ecto.Migration

  def change do
    create table :account do
      add :balance, :decimal
      add :user_id, :string

      timestamps()
    end

    create constraint(:account, :balance_cant_be_negative, check: "balance >= 0")
  end
end
