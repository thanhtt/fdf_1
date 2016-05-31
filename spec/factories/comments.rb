FactoryGirl.define do
  factory :comment do
    content {Faker::Name.name}
    factory :invalid_subject do
      content "thanhthanh"
    end
  end
end
