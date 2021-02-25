defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn ii -> String.to_integer(ii) end)
      |> Enum.sum()

      {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, "Invalid file!"}
end
