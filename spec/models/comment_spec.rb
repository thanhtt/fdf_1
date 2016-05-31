require "rails_helper"

describe Comment, type: :model do
  let(:comment) {FactoryGirl.create :comment}
  subject {comment}

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
end
