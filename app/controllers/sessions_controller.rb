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
# Sessions controller
#
class SessionsController < ApplicationController
  ##
  # Login form
  #
  def new
  end

  ##
  # Create session
  #
  def create
    if user = User.where(username: params[:username]).first.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      @error = true
      render :new
    end
  end

  ##
  # Destory sesion
  #
  def destroy
    session.delete(:user_id) if session.key?(:user_id)
    redirect_to root_url
  end
end
