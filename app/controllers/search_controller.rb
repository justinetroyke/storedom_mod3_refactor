class SearchController < ApplicationController
  def show
    @stores = StorePresenter.new(params['zip'])
    store_count = results[@stores.count]
    flash[:notice] = "'#{store_count} Total Stores'"
  end
end
