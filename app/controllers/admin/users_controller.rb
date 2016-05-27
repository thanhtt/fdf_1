class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  layout "admin"

  def index
    @users = User.page params[:page]
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t "users.deleted"
    else
      flash[:danger] = t "users.not_delete"
    end
    redirect_to admin_users_path
  end
end
