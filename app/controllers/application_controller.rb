# Milestone
# Copyright 2013-2015 Jack Polgar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  prepend_before_action :get_project

  def logged_in?
    current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
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

    def require_admin
      return render_no_permission unless logged_in? and current_user.is_admin?
    end

    def get_project
      slug = params[:project_id] || params[:id]
      if project = Project.find_by(slug: slug)
        @current_project = project
      end
    end

    def render_no_permission
      render 'errors/no_permission'
    end

    def render_404
      render 'errors/404'
    end
end
