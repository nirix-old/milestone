class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by username: params[:username]

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new, locals: { error: true }
    end
  end

  def destroy
    session.delete :user_id
    flash[:notice] = t(:you_are_now_logged_out)
    redirect_to root_path
  end
end
