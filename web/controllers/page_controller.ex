defmodule DepartureBoard.PageController do
  use DepartureBoard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
