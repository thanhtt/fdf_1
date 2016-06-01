require "rails_helper"
describe SuggestionsController do
  let(:user){FactoryGirl.create :user}
  let(:suggestion){FactoryGirl.create :suggestion, user: user}

  before{sign_in user}

  describe "POST create" do
    context "valid attributes" do
      before do
        post :create,
        suggestion: FactoryGirl.attributes_for(:suggestion, user_id: user.id)
      end
      it{expect(flash[:success]).to be_present}
      it{expect(response).to redirect_to root_url}
      it{expect(user.suggestions.count).to eq 1}
    end
  end
end
