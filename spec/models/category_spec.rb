require "rails_helper"
require "rspec/mocks"

RSpec.describe Category, type: :model do
  let(:category) {FactoryGirl.create :category}

  describe "validates" do
    context "when name is not valid" do
      before {category.name = nil}
      it {should_not be_valid}
    end
    context "when name lenght greater 50 character" do
      it {should validate_length_of(:name).is_at_most(50)}
    end
  end
end
