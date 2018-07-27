class Store
  attr_reader :result

  def initialize(result)
    @result = result
  end

  def name
    @result['name']
  end

  def city
    @result['city']
  end

  def distance
    @result['distance']
  end

  def phone_number
    @result['phone']
  end

  def store_type
    @result['storeType']
  end
end
