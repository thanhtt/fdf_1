FactoryGirl.define do
  factory  :product do
    name "coca"
    price 5
    category_id 1
    description "this is description"
    image { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  end
end
