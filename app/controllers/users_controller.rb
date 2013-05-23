#
# Milestone
# Copyright (C) 2012-2013 J. Polgar
# https://github.com/nirix
#
# Milestone is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 only.
#
# Milestone is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Milestone. If not, see <http://www.gnu.org/licenses/>.
#

class UsersController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

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
