class ProductsController < ApplicationController
  def index
    @products = Product.paginate page: params[:page],
      per_page: Settings.per_page
    @products = Product.all
    @line_item = current_order.line_items.new
  end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new product: @product
    @comments = @product.comments.order(created_at: :desc).
      paginate page: params[:page], per_page: Settings.per_page
  end
end
