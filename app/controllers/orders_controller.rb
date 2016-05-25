class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = current_user.orders.paginate page:
      params[:page], per_page: Settings.per_page
  end

  def show
    @line_items = current_order.line_items
  end

  def update
    @order.user = current_user
    if @order.update_attributes order_params
      session.delete :order_id
      flash[:success] = I18n.t "order.thanks_order"
    else
      flash[:danger] = I18n.t "order.order_failed"
    end
    redirect_to user_orders_path current_user
  end

  private
  def order_params
    params.require(:order).permit :user_id, :total_pay, :status
  end
end
