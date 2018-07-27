require "rails_helper"

describe "returns stores closest to zip from bestbuy" do
  zip = 80202
  results = StorePresenter.new(zip)

  expect(results.count).to eq(14)
  results.each do |store|
    expect(store.class).to eq(Store)
    expect(store).to eq("BELMAR CO")
    expect(store).to eq("Lakewood")
    expect(store).to eq(5.31)
    expect(store).to eq("303-742-8039")
    expect(store).to eq("Big Box")
  end
end
