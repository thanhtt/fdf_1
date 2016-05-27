class Admin::OrdersController < ApplicationController
  load_and_authorize_resource

  layout "admin"

  def index
    @orders = @orders.page params[:page]
  end

  def show
    @line_items = @order.line_items
  end
end
