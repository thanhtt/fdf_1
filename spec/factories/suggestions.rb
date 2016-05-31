FactoryGirl.define do
  factory :suggestion do
    content {Faker::Name.name}
    user_id 1
  end
end
