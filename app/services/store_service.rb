class StoreService
  def initialize(path, params = {})
    @url = "https://api.bestbuy.com/v1/"
    params = "path/#{params[:format]}"
    @params = {ENV['best_buy_app_key']}.merge(params)
  end

  def conn
    Faraday.new(@url) do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    response = conn.get @path
    JSON.parse(response.body)
  end

  def nearby_stores
    binding.pry
    regions = response['results'].first['lexicalEntries'].first['sentences']
    # entries = regions.find_all { |region| region["regions"] == ["North American"] }
    # entries.map { |entry| entry["text"] }
  end
end
