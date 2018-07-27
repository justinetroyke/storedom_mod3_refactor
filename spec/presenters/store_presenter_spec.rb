require "rails_helper"

describe "returns stores closest to zip from bestbuy" do
  it 'should bring back objects' do
    zip = 80202
    results = StorePresenter.new(zip).nearby_stores

    expect(results.count).to eq(14)
    results.each do |store|
      expect(store.class).to eq(Store)
      expect(store.name).to eq("BELMAR CO")
      expect(store.city).to eq("Lakewood")
      expect(store.distance).to eq(5.31)
      expect(store.phone_number).to eq("303-742-8039")
      expect(store.store_type).to eq("Big Box")
    end
  end
end
