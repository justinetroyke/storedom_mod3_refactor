class StorePresenter
  attr_reader :zip

  def initialize(zip)
    @zip = zip
  end

  def path
    "stores(area(#{@zip},25))"
  end

  def params
    {format: 'json'}
  end

  def results
    StoreService.new(path, params).response['stores']
  end

  def nearby_stores
    results.map do |result|
      Store.new(result)
    end
  end
end
