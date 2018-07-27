require 'rails_helper'

describe 'enter zip code for stores near by' do
  context "As a guest user search 80202" do
    it "stores within 25 miles of 80202" do
      zip = 80202
      message = "10 Total Stores"

      visit '/'
      # When I visit "/"
      fill_in :zip, with: zip
      click_on 'Search'
      # And I fill in a search box with "80202" and click "search"
      expect(current_path).to eq("/search")
      # Then my current path should be "/search" (ignoring params)
      expect(page).to have_content(message)
      # And I should see a message that says "14 Total Stores"
      within('.stores') do
        expect(page).to have_content("BELMAR CO")
        expect(page).to have_content("Lakewood")
        expect(page).to have_content(5.31)
        expect(page).to have_content("303-742-8039")
        expect(page).to have_content("Big Box")
      end
      # And I should see stores within 25 miles of 80202
      # And I should see the long name, city, distance, phone number and store type for each of the 10 results
      # And I should see exactly 10 results (There are 14 stores within 25 miles. We want to display 10 on this page and 4 on the next. Get the first page to work first from start to finish and worry about pagination later.)
    end
  end
end



# As a user
