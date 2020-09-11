defmodule PersonalBaseWeb.OrderController do
  use PersonalBaseWeb, :controller


  #CoffeShop example
  def create(conn, params) do
    IO.inspect(params)
    # conn
    order_params = params |> Map.fetch!("order")

    case PersonalBase.open_order(order_params) do
      {:ok, order} ->
        conn
        |> html(order.for)
      {:error, error} ->
        raise error
    end
  end
end
