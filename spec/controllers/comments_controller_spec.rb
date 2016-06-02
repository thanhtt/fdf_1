require "rails_helper"
describe CommentsController do
  let(:user){FactoryGirl.create :user}
  let(:product){FactoryGirl.create :product}
  let(:comment){FactoryGirl.create :comment, user_id: user.id, product_id: product.id}

  before{sign_in user}

  describe "POST create" do
    before do
      allow(Comment).to receive(:new).and_return comment
    end

    context "when the comment fails to save" do
      before do
        allow(comment).to receive(:save).and_return false
        post :create, comment: {content: comment.content, product_id: product.id}, product_id: product.id
      end
      it{expect(response).to redirect_to root_path}
      it{expect(flash[:danger]).should_not be_nil}
    end

    context "when the comment saves successfully" do
      before do
        allow(comment).to receive(:save).and_return true
        post :create, comment: {content: comment.content, product_id: product.id}, product_id: product.id
      end
      it{expect(response).to redirect_to root_path}
      it{expect(flash[:success]).should_not be_nil}
    end
  end
end
