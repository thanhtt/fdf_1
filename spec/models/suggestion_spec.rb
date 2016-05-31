require "rails_helper"

describe Suggestion, type: :model do
  let(:suggestion) {FactoryGirl.create :suggestion}
  subject {suggestion}

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when content is not valid" do
      before {subject.content = nil}
      it {should_not be_valid}
    end
  end

  describe "when content has length more than 50" do
    before {subject.content = "a"*51}
    it {should_not be_valid}
  end

  describe "when content has length less than 50" do
    before {subject.content = "a"*50}
    it {should be_valid}
  end

  describe "when user_id is nil" do
    before {subject.user_id = nil}
    it {should_not be_valid}
  end
end
