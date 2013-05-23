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

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    session.include?(:user_id) and User.exists?(session[:user_id])
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  private

    def already_signed_in
      if logged_in?
        flash[:error] = t(:already_signed_in)
        redirect_to root_path
      end
    end
end
