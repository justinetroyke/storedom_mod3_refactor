class ItemsController < ApplicationController
  def index
    @items = Item.all
    # response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV['best_buy_app_key']}")
    # results = JSON.parse(response.body)
    # binding.pry
    redirect_to "/search"
  end

  def show
    @item = Item.find(params[:id])
  end
end
