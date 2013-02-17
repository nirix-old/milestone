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

##
# Users controller
#
class UsersController < ApplicationController
  ##
  # Login form
  #
  def login
  end

  ##
  # Register form
  #
  def new
    @user = User.new
  end

  ##
  # Create user
  #
  def create
    @user = User.new({
      username: params[:user][:username],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      email: params[:user][:email],
      name: params[:user][:name]
    })

    if @user.save
      flash[:success] = t(:account_successfully_created)
      redirect_to '/login'
    else
      render :new
    end
  end

  ##
  # Logout page
  #
  def logout
  end
end
