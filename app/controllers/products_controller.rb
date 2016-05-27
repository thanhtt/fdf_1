class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.paginate page: params[:page],
      per_page: Settings.per_page
    @products = Product.all
    @line_item = current_order.line_items.new
    @search = Product.search params[:q]
    @products = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?
  end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new product: @product
    @comments = @product.comments.order(created_at: :desc).
      paginate page: params[:page], per_page: Settings.per_page
  end
end
