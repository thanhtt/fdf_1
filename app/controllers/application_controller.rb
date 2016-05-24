class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  def current_order
    if session[:order_id].present?
      Order.find session[:order_id]
    else
      Order.new
    end
  end
end
