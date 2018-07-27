require "rails_helper"

describe "returns stores from bestbuy" do
  it 'returns closest stores for zip' do
    zip = 80202
    miles = 25
    params = {format: 'json'}
    path = "stores(area(#{zip}#{miles}))"

    response = StoreService.new(path, params).nearby_stores

    expect(response.count).to eq(14)
  end
end
