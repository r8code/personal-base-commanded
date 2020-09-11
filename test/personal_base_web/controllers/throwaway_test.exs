defmodule PersonalBaseWeb.ThrowawayTest do
  use PersonalBaseWeb.ConnCase

  test "commanded is working", %{conn: conn} do
    order_id = "a1a1a1a1-a1a1-a1a1-a1a1-a1a1a1a1a1a1"

    params = %{
      "order" => %{
        "order_id" => order_id,
        "for" => "Ben"
      }
    }

    conn = post(conn, "/orders", params)
    assert html_response(conn, 200) =~ "Ben"
  end
end
