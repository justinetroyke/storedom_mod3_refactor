class SearchController < ApplicationController
  def show
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&apiKey=#{ENV['best_buy_app_key']}")
    results = JSON.parse(response.body)
    store_count = results['total']
    flash[:notice] = "'#{store_count} Total Stores'"
  end
end
