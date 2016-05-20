class StaticPagesController < ApplicationController
  def home
    @products = Product.paginate page: params[:page],
      per_page: Settings.per_page
  end
end
