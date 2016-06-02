FactoryGirl.define do
  factory :product do
    name {Faker::Name.name}
    description "abc"
    price "1"
     image { File.new(Rails.root.join("app", "assets", "images", "big-star.png")) }
    category_id 1
    id 1
  end
end
