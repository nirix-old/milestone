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

class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    params = user_params

    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
    end

    @user.update_attributes params

    if @user.save
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit([
        :name,
        :username,
        :email,
        :password,
        :password_confirmation,
        :usergroup_id
      ])
    end
end
