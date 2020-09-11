defmodule PersonalBaseWeb.PageController do
  use PersonalBaseWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
