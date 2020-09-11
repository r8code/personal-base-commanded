defmodule PersonalBase.CoffeeShop.Events.OrderOpened do

  @derive Jason.Encoder
  defstruct [:order_id, :for, :status]
end
