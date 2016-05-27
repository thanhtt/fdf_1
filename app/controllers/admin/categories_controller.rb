class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  layout "admin"

  def index
    @categories = Category.page params[:page]
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "categories.created"
      redirect_to admin_categories_path
    else
      flash[:danger] = t "categories.error"
      render :new
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "categories.updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "categories.deleted"
    else
      flash[:danger] = t "categories.not_delete"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
