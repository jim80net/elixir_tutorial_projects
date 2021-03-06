defmodule AuctionWeb.PageController do
  use AuctionWeb, :controller
  import Auction

  def index(conn, _params) do
    items = Auction.list_items()
    render(conn, "index.html", items: items)
  end
end
