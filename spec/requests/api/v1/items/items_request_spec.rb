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
    items = create_list(:item, 3)
    item = create(:item)

    get "/api/v1/items/#{item.id}"
    # When I send a GET request to `/api/v1/items/1`
    expect(response).to be_successful
    result = JSON.parse(response.body)

    expect(result["id"]).to eq(item.id)
    expect(result["name"]).to eq(item.name)
    expect(result["description"]).to eq(item.description)
    expect(result["image_url"]).to eq(item.image_url)
    expect(result['created_at']).to be_nil
    expect(result['updated_at']).to be_nil
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end

  it 'can delete one item by id' do
    items = create_list(:item, 3)
    item = create(:item)

    expect{delete "/api/v1/items/#{item.id}"}.to change(Item, :count).by(-1)
    # When I send a DELETE request to `/api/v1/items/1`
    expect(response).to be_successful
    expect(Item.count).to eq(3)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    # I receive a 204 JSON response if the record is successfully deleted
  end

  it 'cretes a new a new item' do
    item_params = { name: "Bowling Ball", description: "Over the line", image_url: "http://robohash.org/bowling_ball.png?set=set2&bgset=bg1&size=200x200"}

    post "/api/v1/items", params: {item: item_params}
    # item = JSON.parse(response.body)
    # When I send a POST request to `/api/v1/items` with a name, description, and image_url
    item = Item.last
    assert_response :success
    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
    expect(item.name).to eq(item_params[:id])
    expect(item.name).to eq(item_params[:description])
    expect(item.name).to eq(item_params[:image_url])
    expect(item['created_at']).to be_nil
    expect(item['updated_at']).to be_nil
    # I receive a 201 JSON  response if the record is successfully created
    # And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
  end
end


# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn’t the default `ApplicationController` support POST and PUT requests?
