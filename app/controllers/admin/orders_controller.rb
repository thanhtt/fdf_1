class Admin::OrdersController < ApplicationController
  load_and_authorize_resource

  layout "admin"

  def index
    @orders = @orders.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
    @line_items = @order.line_items
  end
end
