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

class SessionsController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
  end

  def create
    if user = User.find_by(username: params[:user][:username]) and user.try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = t(:logged_in_successfully)
      redirect_to root_path
    else
      render :new, locals: { error: true }
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = t(:logged_out_successfully)
    redirect_to root_path
  end
end
