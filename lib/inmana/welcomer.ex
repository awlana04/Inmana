defmodule Inmana.Welcomer do
  # Receive the user's name and age
  # If the user is registered, it might receive a special welcome screen
  # If the user is more than 18, it receives a normal message
  # But if it's not, returns an error
  # Handle the user's name to wrong entrys

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special banana ❤"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name} 😠"}
  end
end
