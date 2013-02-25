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

  def initialize
    super

    # Fetch all settings
    @_settings = {}
    Setting.all.each do |setting|
      @_settings[setting.name] = setting.value
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

  ##
  # Returns the value of the setting.
  #
  # @return [Mixed]
  #
  def setting(setting)
    @_settings[setting.to_s]
  end
  helper_method :setting

  ##
  # Require the user be an admin.
  #
  def require_admin
    if !logged_in? or !current_user.is_admin?
      render_403
      return false
    end
  end

  ##
  # Renders a no permission page.
  #
  def render_403
    render_error :'errors.no_permission.message', 403
  end

  ##
  # Renders an error page
  #
  # @param [Mixed]   message Error message
  # @param [Integer] status  Status code
  def render_error(message, status = 500)
    @message = message
    @status  = status

    # If the message is a symbol, get the translation
    @message = t(@message) if @messsage.is_a?(Symbol)

    respond_to do |format|
      format.html { render 'errors/common', status: @status }
    end
  end
end
