require "rails_helper"
require "rspec/mocks"

describe Order, type: :model do
  let(:order) {FactoryGirl.create :order}
  subject {order}
  describe "call_back" do
    context "when before save" do
      it {is_expected.to callback(:update_total_pay).before :save}
    end

    context "when after update order" do
      it {is_expected.to callback(:send_email).after :update}
      it {is_expected.to callback(:send_chatwork).after :update}
    end
  end
end
