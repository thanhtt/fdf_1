require "rails_helper"
require "rspec/mocks"

RSpec.describe Product, type: :model do
  let(:product) {FactoryGirl.create :product}

  describe "validates" do
    context "when name is not valid" do
      before {product.name = nil}
      it {should_not be_valid}
    end

    context "when name lenght greater 50 character" do
      it {should validate_length_of(:name).is_at_most(50)}
    end

    context "price is not nil" do
      before {product.price = nil}
      it {is_expected.to have(2).error_on(:price)}
    end

    context "price is number" do
      before {product.price = "a"}
      it {is_expected.to have(2).error_on(:price)}
    end
  end
end
