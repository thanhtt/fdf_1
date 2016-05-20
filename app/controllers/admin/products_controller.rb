class Admin::ProductsController < ApplicationController
  before_action :load_product, except: [:new, :create, :index]
  load_and_authorize_resource

  def index
    @products = Product.paginate page: params[:page]
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "products.created"
      redirect_to admin_products_path
    else
      flash[:danger] = t "products.error"
      render :new
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "products.updated"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t "products.deleted"
    else
      flash[:danger] = t "products.not_delete"
    end
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :price,
      :category_id, :image, :remove_image
  end

  def load_product
    @product = Product.find params[:id]
  end
end
