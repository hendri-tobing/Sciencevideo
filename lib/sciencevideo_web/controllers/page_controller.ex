defmodule SciencevideoWeb.PageController do
  use SciencevideoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
