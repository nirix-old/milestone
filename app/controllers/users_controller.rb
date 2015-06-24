class UsersController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.usergroup_id = 2

    if @user.save
      flash[:success] = t(:account_created)
      redirect_to login_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :email)
    end
end
