require "rails_helper"

describe "suggestions/new.html.erb", type: :view do
  let(:user) {FactoryGirl.create :user}
  let(:product) {FactoryGirl.create :product}
  let(:suggestion) {FactoryGirl.create :suggestion}
  it {expect(controller.request.path_parameters[:action]).to eq "new"}

  describe "suggestion is testing" do
    before do
      sign_in user
      assign :suggestion, suggestion
      assign :product_ids, product
      assign :products, [product]
      render
    end

    it "test form selector" do
      expect(rendered).to have_selector "form" do |form|
        form.is_epected.to have_selector "select", name: "product_id"
        form.is_epected.to have_selector "textarea", name: "content"
        form.is_epected.to have_selector "input", type: "submit"
      end
    end
  end
end
