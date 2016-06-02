FactoryGirl.define do
  factory :comment do
    content {Faker::Name.name}
  end
end
