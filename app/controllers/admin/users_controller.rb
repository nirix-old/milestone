class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    params = user_params

    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
    end

    @user.update_attributes params

    if @user.save
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit([
        :name,
        :username,
        :email,
        :password,
        :password_confirmation,
        :usergroup_id
      ])
    end
end
