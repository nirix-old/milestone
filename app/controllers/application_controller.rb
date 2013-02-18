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
# Application controller.
#
class ApplicationController < ActionController::Base
  protect_from_forgery

    end
  end

  ##
  # Gets the current user.
  #
  # @return [Object]
  #
  def current_user
    @_current_user ||= User.find(session[:user_id]) if session.key?(:user_id)
  end
  helper_method :current_user

  ##
  # Returns true or false if the user is logged in
  # or not.
  #
  # @return [Boolean]
  #
  def logged_in?
    current_user
  end
  helper_method :logged_in?
end
