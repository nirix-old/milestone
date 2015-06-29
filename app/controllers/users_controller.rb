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

class UsersController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.usergroup_id = 2

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
