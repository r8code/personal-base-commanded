defmodule PersonalBase do
  @moduledoc """
  PersonalBase keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias PersonalBase.EventApp

  #CoffeShop example
  def open_order(params) do
    command = %PersonalBase.CoffeeShop.Commands.OpenOrder{
      order_id: params |> Map.fetch!("order_id"),
      for: params |> Map.fetch!("for")
    }

    case EventApp.dispatch(command, include_execution_result: true) do
      {:ok, %{aggregate_state: order}} ->
        {:ok, order}
      error ->
        error
    end
  end
end
