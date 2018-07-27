class StoreService
  def initialize(path, params = {})
    @url = "https://api.bestbuy.com/v1/"
    @path = path
    @params = {apiKey: ENV['best_buy_app_key']}.merge(params)
  end

  def conn
    Faraday.new(@url)
  end

  def response
    response = conn.get(@path, @params)
    JSON.parse(response.body)
  end
end
