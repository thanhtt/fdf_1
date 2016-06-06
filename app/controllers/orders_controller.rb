class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = current_user.orders.page params[:page]
  end

  def show
    @line_items = @order.line_items
  end

  def update
    @order.user = current_user
    if @order.update_attributes order_params
      UserNotificationService.new(current_user).notify
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
