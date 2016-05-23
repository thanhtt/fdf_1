class Admin::UsersController < ApplicationController
  before_action :load_user, only: [:show, :destroy]
  load_and_authorize_resource

  layout "admin"

  def index
    @users = User.paginate page: params[:page],
      per_page: Settings.per_page
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

  private
  def load_user
    @user = User.find params[:id]
  end
end
