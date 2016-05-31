require "rails_helper"
require "cancan/matchers"

RSpec.describe User, type: :model do
  before {@user = FactoryGirl.build :user}
  before {@user2 = FactoryGirl.build :user}

  subject {@user}
  it {should respond_to :email}
  it {should respond_to :password}
  it {should respond_to :password_confirmation}

  it {should be_valid}

  describe "when email is not present" do
    before {@user.email = " "}
    it {should_not be_valid}
  end

  describe "when password is not present" do
    before {@user.password = " "}
    it {should_not be_valid}
  end

  describe "when password has length less than 8" do
    before {@user.password = "a"*8}
    it {should_not be_valid}
  end

  describe "can authenticate" do
    context "admin" do
      before {@user4 = FactoryGirl.build :user, role: 0}
      subject(:ability){Ability.new(@user4)}
      it{should be_able_to :manage, Suggestion}
      it{should be_able_to :manage, Comment}
      it{should be_able_to :manage, User}
      it{should be_able_to :manage, Product}
    end

    context "user" do
      before {@user3 = FactoryGirl.build :user, role: 1}
      subject(:ability){Ability.new(@user3)}
      it{should_not be_able_to :manage, Suggestion}
      it{should be_able_to :read, Suggestion}
      it{should be_able_to :update, Suggestion}
      it{should be_able_to :create, Suggestion}
      it{should be_able_to :read, Order}
      it{should be_able_to :update, Order}
      it{should_not be_able_to :destroy, Order}
    end
  end
end
