defmodule PersonalBase.EventRouter do
  use Commanded.Commands.Router

  #CoffeeShop Example
  alias PersonalBase.CoffeeShop.Aggregates.Order
  alias PersonalBase.CoffeeShop.Commands.OpenOrder

  dispatch OpenOrder, to: Order, identity: :order_id


end
