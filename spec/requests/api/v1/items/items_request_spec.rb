require 'rails_helper'

describe 'Items API' do
  it 'sends a list of all items' do
    create_list(:item, 3)

    get "/api/v1/items"
    # When I send a GET request to `/api/v1/items`

    expect(response).to be_successful
    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    items.each do |item|
      expect(item['id']).to be_instance_of(Integer)
      expect(item['name']).to be_instance_of(String)
      expect(item['description']).to be_instance_of(String)
      expect(item['image_url']).to be_instance_of(String)
      expect(item['created_at']).to be_nil
      expect(item['updated_at']).to be_nil
    end
    # I receive a 200 JSON response containing all items
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
  end

  it 'can get one item by id' do
    create_list(:item, 3)
    item = create(:item)


    get "/api/v1/items/#{item.id}"
    # When I send a GET request to `/api/v1/items/1`

    expect(response).to be_successful
    result = JSON.parse(response.body)

    expect(result.count).to eq(1)
    expect(result["id"]).to eq(item.id)
    expect(result["name"]).to eq(item.name)
    expect(result["description"]).to eq(item.description)
    expect(result["image_url"]).to eq(item.image_url)
    expect(result['created_at']).to be_nil
    expect(result['updated_at']).to be_nil
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end
end

# *1. Create an API*
#
# We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.
#
#
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn’t the default `ApplicationController` support POST and PUT requests?
