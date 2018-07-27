FactoryBot.define do

  factory :item do
    name = name Faker::Lebowski.character
    description Faker::Lebowski.quote
    image_url "http://robohash.org/#{name}.png?set=set2&bgset=bg1&size=200x200"
  end
end
