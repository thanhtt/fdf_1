class LineItemsController < ApplicationController
  def create
    @order = current_order
    @line_item = @order.line_items.new line_item_params
    @order.save
    session[:order_id] = @order.id
  end

  private
  def line_item_params
    params.require(:line_item).permit :quantity, :product_id
  end
end
