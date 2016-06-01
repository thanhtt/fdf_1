require "rails_helper"
describe SuggestionsController do
  let(:user){FactoryGirl.create :user}
  let(:suggestion){FactoryGirl.create :suggestion, user: user}

  before{sign_in user}

  describe "POST create" do
    before do
      allow(suggestion).to receive(:new).and_return suggestion
    end

    context "when the suggestion fails to save" do
      before do
        allow(suggestion).to receive(:save).and_return false
        post :create, suggestion: {content: suggestion.content, user_id: user.id}
      end
      it{expect(response).to redirect_to root_url}
      it{expect(flash[:danger]).should_not be_nil}
    end

    context "when the suggestion saves successfully" do
      before do
        allow(suggestion).to receive(:save).and_return true
        post :create, suggestion: {content: suggestion.content, user_id: user.id}
      end
      it{expect(response).to redirect_to root_url}
      it{expect(flash[:success]).should_not be_nil}
    end
  end
end
