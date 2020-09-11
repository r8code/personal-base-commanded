defmodule PersonalBase.CoffeeShop.Commands do
  defmodule OpenOrder do
    @enforce_keys [:order_id, :for]
    defstruct [:order_id, :for]
  end

end
