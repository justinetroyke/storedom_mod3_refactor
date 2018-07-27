class SearchController < ApplicationController
  def show
    @stores = StorePresenter.new(params['zip']).nearby_stores
    flash[:notice] = "'#{@stores.count} Total Stores'"
  end
end
