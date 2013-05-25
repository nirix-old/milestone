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

  prepend_before_action :get_project

  def logged_in?
    session.include?(:user_id) and User.exists?(session[:user_id])
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  # This needs to be better
  def setting(name)
    @_settings = {} unless @_settings

    unless @_settings.include? name.to_sym
      begin
        @_settings[name.to_sym] = Setting.find_by(name: name.to_s).value
      rescue
        @_settings[name.to_sym] = nil
      end
    end

    @_settings[name.to_sym]
  end
  helper_method :setting

  def current_project
    @current_project ||= false
  end
  helper_method :current_project

  private

    def already_signed_in
      if logged_in?
        flash[:error] = t(:already_signed_in)
        redirect_to root_path
      end
    end

    def get_project
      slug = params[:project_slug] || params[:slug]
      if project = Project.find_by(slug: slug)
        @current_project = project
      end
    end
end
